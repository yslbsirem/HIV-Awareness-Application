import matplotlib.pyplot as plt
import mysql.connector

# Connect MySQL server with python
cnx = mysql.connector.connect(
    user='root',
    password='password',
    host='localhost',
    database='306_step2'
)

# Make a cursor object. 
cursor = cnx.cursor()

# A new view named as hiv_summary was created speficially for data visualization.
# This code uses hiv_summary to obtain data of woman_ratio, years and total_funding. 
# Top 10 countries having lowest woman_ratio was selected and year range was selected as 2010-2015.

query = "SELECT total_funding, woman_ratio FROM hiv_summary WHERE years BETWEEN 2010 AND 2015 AND total_funding IS NOT NULL AND woman_ratio IS NOT NULL ORDER BY woman_ratio ASC LIMIT 10"
cursor.execute(query)
data = cursor.fetchall()

# Separate the values of total_funding and woman_ratio
total_funding = []
woman_ratio = []
for row in data:
    total_funding.append(row[0])
    woman_ratio.append(row[1])

# Make values on the x-axis in an increasing order
x = range(len(woman_ratio))

# Plot the line chart
plt.plot(x, total_funding, marker='o')

# Give names ta labels and title
plt.xlabel("Woman Ratio")
plt.ylabel("Total Funding")
plt.title("Line Chart of Total Funding for Top 10 Countries with Lowest Woman Ratio (2010-2015)")

# Round the values on x-axis by 2. Rotate the values so that they are clear and readable. Adjust spacing.
sorted_labels = [label for _, label in sorted(zip(woman_ratio, woman_ratio))]
rounded_labels = [round(float(label), 2) for label in sorted_labels]
plt.xticks(x, rounded_labels, rotation='vertical')
plt.subplots_adjust(bottom=0.15)

# Print the line chart
plt.show()

# Cursor and connection closing
cursor.close()
cnx.close()
