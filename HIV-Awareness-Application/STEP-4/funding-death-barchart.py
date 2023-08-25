
import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt

cnx = mysql.connector.connect(user='root', password='password', host='localhost', database='306_step2')

# Query the data from the views
query = "SELECT ISOYEAR, death_num FROM AverageFunding"
cursor = cnx.cursor()
cursor.execute(query)
avgfund_death_data = cursor.fetchall()

query = "SELECT ISOYEAR, death_num FROM TopFunding"
cursor.execute(query)
topfund_death_data = cursor.fetchall()

# Convert the data to pandas DataFrame
Average_Funding_Countries = pd.DataFrame(avgfund_death_data, columns=['ISOYEAR', 'death_num'])
Top_Funding_Countries = pd.DataFrame(topfund_death_data, columns=['ISOYEAR', 'death_num'])

# Calculate the mean death count by year
avg_death_by_year_avgfund = Average_Funding_Countries.groupby('ISOYEAR')['death_num'].mean().reset_index()
avg_death_by_year_topfund = Top_Funding_Countries.groupby('ISOYEAR')['death_num'].mean().reset_index()

# Plot the data
plt.figure(figsize=(10, 6))

# Bar plot for avgfund_death
plt.bar(avg_death_by_year_avgfund['ISOYEAR'], avg_death_by_year_avgfund['death_num'], label='Average Funding Countries')

# Bar plot for topfund_death
plt.bar(avg_death_by_year_topfund['ISOYEAR'], avg_death_by_year_topfund['death_num'], label='Top Funding Countries')

# Set labels and title
plt.xlabel('Countries (Funding Increases Left to Right)')
plt.ylabel('Mean Death Count')
plt.title('HIV Death Cases & HIV Funding')

# Show legend
plt.legend()

# Display the plot
plt.show()

# Close the MySQL connection
cursor.close()
cnx.close()