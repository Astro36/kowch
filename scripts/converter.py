from argparse import ArgumentParser
import glob
import sys
import mariadb
import xmltodict


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument('path', help='dictionary directory path')
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

    cursor.execute('SELECT * FROM languages')
    languages = dict((desc, id) for id, desc in cursor.fetchall())

    cursor.execute('SELECT * FROM pos')
    pos = dict((desc, id) for id, desc in cursor.fetchall())

    cursor.execute('SELECT * FROM kinds')
    kinds = dict((desc, id) for id, desc in cursor.fetchall())

    cursor.execute('SELECT * FROM categories')
    categories = dict((desc, id) for id, desc in cursor.fetchall())

    for filepath in glob.glob(args.path):
        with open(filepath, 'rb') as file:
            kodic = []

            for item in xmltodict.parse(file)['channel']['item']:
                word = item['wordInfo']['word']
                language_id = languages[item['wordInfo']['word_type'] if item['wordInfo']['word_type'] else '미분류']
                pos_id = pos[item['senseInfo']['pos'] if 'pos' in item['senseInfo'] else '미분류']
                kind_id = kinds[item['senseInfo']['type']]
                definition = item['senseInfo']['definition']
                category_id = categories[item['senseInfo']['cat_info']['cat'] if 'cat_info' in item['senseInfo'] else '미분류']

                kodic.append((word, language_id, pos_id, kind_id, definition, category_id))

            cursor.executemany('INSERT INTO words (`word`, `language_id`, `pos_id`, `kind_id`, `definition`, `category_id`) VALUES (?, ?, ?, ?, ?, ?)', kodic)
            conn.commit()

