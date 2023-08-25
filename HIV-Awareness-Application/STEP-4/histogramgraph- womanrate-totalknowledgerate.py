import matplotlib.pyplot as plt
import mysql.connector


cnx = mysql.connector.connect(
    user='root',
    password='password',
    host='localhost',
    database='306_step2'
)


cursor = cnx.cursor()

query = """
    SELECT h.total_knowledge_rate, w.woman_ratio
    FROM HIV_education h
    INNER JOIN woman w ON h.ISOYEAR = w.ISOYEAR
    WHERE h.total_knowledge_rate IS NOT NULL AND w.woman_ratio IS NOT NULL
    ORDER BY w.woman_ratio ASC
"""
cursor.execute(query)
data = cursor.fetchall()


total_knowledge_rate = []
woman_ratio = []
for row in data:
    knowledge_rate = row[0]
    if knowledge_rate is not None:
        total_knowledge_rate.append(knowledge_rate)
        woman_ratio.append(row[1])


plt.hist(woman_ratio, bins=20, edgecolor='black')


plt.xlabel("Woman Ratio")
plt.ylabel("Total Knowledge Rate")


plt.title("Histogram of Total Knowledge Rate by Woman Ratio")


plt.show()


cursor.close()
cnx.close()
