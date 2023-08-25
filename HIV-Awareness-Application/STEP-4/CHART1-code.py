import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt

cnx = mysql.connector.connect(user='root', password='password', host='localhost', database='306_step2')
cursor = cnx.cursor()

query = '''
    SELECT years, isocodes, total_knowledge_rate, death_num
    FROM hiv_summary
    WHERE total_knowledge_rate IS NOT NULL AND death_num IS NOT NULL
        AND total_knowledge_rate != 0 AND death_num != 0
        AND years = 2016
'''
cursor.execute(query)

df = pd.DataFrame(cursor.fetchall(), columns=["years", "isocodes", "total_knowledge_rate", "death_num"])

cnx.close()

filtered_df = df[df["death_num"] >= 10000]

plt.scatter(filtered_df["total_knowledge_rate"], filtered_df["death_num"], alpha=1)
plt.title("HIV total_knowledge_rate and death rates for countries with (2016)")
plt.xlabel("Total total_knowledge_rate")
plt.ylabel("Death rates")

plt.xticks(range(0, int(filtered_df["total_knowledge_rate"].max()), 10))

plt.show()
