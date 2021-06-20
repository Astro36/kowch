from argparse import ArgumentParser
import mariadb


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument('-h', '--host', help='database host', dest='db_host')
    parser.add_argument('-d', '--database', help='database name', dest='db_name')
    parser.add_argument('-u', '--user', help='database user', dest='db_user')
    parser.add_argument('-p', '--password', help='database user password', dest='db_password')
    args = parser.parse_args()

    conn = mariadb.connect(user=args.db_user,
                           password=args.db_password,
                           host=args.db_host,
                           database=db_name)
    cursor = conn.cursor()

    cursor.execute('SELECT DISTINCT start_char, end_char FROM v_words')
    acronyms = cursor.fetchall()

    start_chars = set(start_char for start_char, _ in acronyms)

    chars_by_chain_size = [set()] # end char

    for start_char, end_char in acronyms:
        if end_char not in start_chars:
            chars_by_chain_size[0].add(end_char)
    chars_by_chain_size.append(set())
    stored_chars = set(chars_by_chain_size[0])

    t = 1
    while t < 5:
        for start_char, end_char in acronyms:
            if start_char not in stored_chars and end_char in chars_by_chain_size[t - 1]:
                chars_by_chain_size[t].add(start_char)
        chars_by_chain_size.append(set())
        stored_chars |= chars_by_chain_size[t]
        t += 1

    for t, chars in enumerate(chars_by_chain_size):
        print(f'chain_size={t} ({"lose" if t % 2 else "win"}): {list(chars)[:10]} ({len(chars)})')
       
