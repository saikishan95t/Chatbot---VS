USE iPPiChatbot
GO

INSERT INTO meta.ConversationWindow
(
	conversationKey
)
VALUES
(
	'COURTESIES'
),
(
	'PRE_REGISTRATION'
),
(
	'MISSING_DATA'
),
(
	'VALUATION'
),
(
	'USER_QUERY'
),
(
	'FEEDBACK'
)

-----------------Pre-Registration Data--------------------------------------------------

INSERT INTO meta.question
(
	conversationID,
	questionType,
	questionKey,
	questionValue
)
VALUES
(
	10,
	'ASSERTIVE',
	'AS_GREETING',
	'Hello, How are ya!!'
),
(
	10,
	'ASSERTIVE',
	'AS_THANK',
	'Thank you, and good day to ya!!'
),
(
	11,
	'QUESTION',
	'QUE_NAME',
	'My name is iPPiBot, and you are?'
),
(
	11,
	'QUESTION',
	'QUE_PROFESSION',
	'Just to serve you better, let me know who you are by profession?'
),
(
	11,
	'QUESTION',
	'QUE_EMAIL',
	'Can I get your E-mail?'
),
(
	11,
	'QUESTION',
	'QUE_TRIAL_VERSION',
	'Do you wish to sign up for a trial version?'
),
(
	11,
	'ASSERTIVE',
	'AS_VERIFICATION_MAIL',
	'Thank you so much. A verification mail has been sent to you, please check your inbox.'
),
(
	11,
	'QUESTION',
	'QUE_TUTORIAL',
	'Thank you for signing up for our trial version. Would you be interested to take a small tutorial to help you navigate the application easily?'
),
(
	11,
	'ASSERTIVE',
	'AS_TUTORIAL_VIDEO',
	'Please wait while I redirect you to the tutorial video.'
)


INSERT INTO meta.Answer
(
	questionID,
	answerType,
	answerKey,
	answerValue
)
VALUES
(
	1002,
	'TEXT',
	'NAME',
	NULL
),
(
	1003,
	'RADIO_BUTTON',
	'PROFESSION_REALTOR',
	'Realtor'
),
(
	1003,
	'RADIO_BUTTON',
	'PROFESSION_BANKER',
	'Banker'
),
(
	1003,
	'RADIO_BUTTON',
	'PROFESSION_GOVT_OFFICIAL',
	'Government Official'
),
(
	1003,
	'RADIO_BUTTON',
	'PROFESSION_STUDENT',
	'Student'
),
(
	1003,
	'RADIO_BUTTON',
	'OTHER',
	'Other'
),
(
	1004,
	'TEXT',
	'EMAIL',
	NULL
),
(
	1005,
	'RADIO_BUTTON',
	'TRIALVERSION_YES',
	'Yes'
),
(
	1005,
	'RADIO_BUTTON',
	'TRIALVERSION_NO',
	'No'
),
(
	1006,
	'NONE',
	'NO_ANSWER',
	NULL
),
(
	1007,
	'RADIO_BUTTON',
	'TUTORIAL_YES',
	'Yes'
),
(
	1007,
	'RADIO_BUTTON',
	'TUTORIAL_NO',
	'No'
),
(
	1008,
	'NONE',
	'NO_ANSWER',
	NULL
)


-------------------------------Missing Data---------------------------------------

INSERT INTO meta.question
(
	conversationID,
	questionType,
	questionKey,
	questionValue
)
VALUES
(
	12,
	'QUESTION',
	'QUE_INCENTIVE',
	'Hey! How are ya! Hope your search was helpful. How would you like to win an easy prize?'
),
(
	12,
	'QUESTION',
	'QUE_MISSING_DATA',
	'There are a few missing data points in this property. If you could point us in the right direction, it would be really helpful?'
),
(
	12,
	'QUESTION',
	'QUE_LOCATION',
	'Where is this property located?'
),
(
	12,
	'QUESTION',
	'QUE_PROPERTY_TYPE',
	'What type of property is this?'
),
(
	12,
	'QUESTION',
	'QUE_BEDS',
	'How many beds does this property have?'
),
(
	12,
	'ASSERTION',
	'AS_INCENTIVE',
	'Thanks a lot for your help. You have recieved a chance to win a brand new iPhone SE 2. We will notify you further through mail.'
)

INSERT INTO meta.Answer
(
	questionID,
	answerType,
	answerKey,
	answerValue
)
VALUES
(
	1009,
	'RADIO_BUTTON',
	'INCENTIVE_YES',
	'Yes'
),
(
	1009,
	'RADIO_BUTTON',
	'INCENTIVE_NO',
	'No'
),
(
	1010,
	'RADIO_BUTTON',
	'MISSING_YES',
	'Yes'
),
(
	1010,
	'RADIO_BUTTON',
	'MISSING_NO',
	'No'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Baggotrath'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Baggotrath East'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Baggotrath North'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Ballsbridge'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Beggarsbush'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Booterstown'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Clonskeagh'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'DonnyBrook'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'DonnyBrook East'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'DonnyBrook West'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Forty Acres'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Grangegorman East'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Grangegorman West'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Intake'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Irishtown'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Lovescharity'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Merrion'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Ringsend'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Sandymount'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Smotscourt'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'South Lots'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'Stillorgan'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'St. George''s'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'St. Mark''s'
),
(
	1011,
	'DROPDOWN',
	'LOCATION',
	'St. Peter''s'
),
(
	1012,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'House'
),
(
	1012,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Semi-Detached House'
),
(
	1012,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Detached House'
),
(
	1012,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Terraced House'
),
(
	1012,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'End of Terrace House'
),
(
	1012,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Townhouse'
),
(
	1012,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Bungalow'
),
(
	1012,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Cottage'
),
(
	1012,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Apartment'
),
(
	1012,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Duplex'
),
(
	1012,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Land'
),
(
	1012,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Site'
),
(
	1013,
	'DROPDOWN',
	'BEDS',
	'1'
),
(
	1013,
	'DROPDOWN',
	'BEDS',
	'2'
),
(
	1013,
	'DROPDOWN',
	'BEDS',
	'3'
),
(
	1013,
	'DROPDOWN',
	'BEDS',
	'4'
),
(
	1013,
	'DROPDOWN',
	'BEDS',
	'5'
),
(
	1013,
	'DROPDOWN',
	'BEDS',
	'6+'
),
(
	1014,
	'NONE',
	'NO_ANSWER',
	NULL
)

------------------------------Valuation----------------------------------------------

INSERT INTO meta.question
(
	conversationID,
	questionType,
	questionKey,
	questionValue
)
VALUES
(
	13,
	'QUESTION',
	'QUE_VALUATION',
	'Hey! Do you want to perform a quick property valuation?'
),
(
	13,
	'QUESTION',
	'QUE_LOCATION',
	'Great! So lets begin by telling me where your property is located:'
),
(
	13,
	'QUESTION',
	'QUE_PROP_TYPE',
	'Okay, what type of property is this?'
),
(
	13,
	'QUESTION',
	'QUE_BEDS',
	'How many beds does the property have?'
),
(
	13,
	'QUESTION',
	'QUE_IF_SIZE',
	'Do you know the size of this house in sqM?'
),
(
	13,
	'QUESTION',
	'QUE_SIZE',
	'Size of the house(sqM):'
),
(
	13,
	'QUESTION',
	'QUE_IF_LAND_SITE',
	'Do you know the size of this land site in acres?'
),
(
	13,
	'QUESTION',
	'QUE_LAND_SITE',
	'Size of the Land Site(acres):'
),
(
	13,
	'ASSERTION',
	'AS_PROP_VALUE',
	'Your property is estimated at: EUR '
)

INSERT INTO meta.Answer
(
	questionID,
	answerType,
	answerKey,
	answerValue
)
VALUES
(
	1015,
	'RADIO_BUTTON',
	'VALUATION_YES',
	'Yes'
),
(
	1015,
	'RADIO_BUTTON',
	'VALUATION_NO',
	'No'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Baggotrath'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Baggotrath East'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Baggotrath North'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Ballsbridge'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Beggarsbush'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Booterstown'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Clonskeagh'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'DonnyBrook'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'DonnyBrook East'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'DonnyBrook West'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Forty Acres'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Grangegorman East'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Grangegorman West'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Intake'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Irishtown'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Lovescharity'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Merrion'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Ringsend'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Sandymount'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Smotscourt'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'South Lots'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'Stillorgan'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'St. George''s'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'St. Mark''s'
),
(
	1016,
	'DROPDOWN',
	'LOCATION',
	'St. Peter''s'
),
(
	1017,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'House'
),
(
	1017,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Semi-Detached House'
),
(
	1017,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Detached House'
),
(
	1017,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Terraced House'
),
(
	1017,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'End of Terrace House'
),
(
	1017,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Townhouse'
),
(
	1017,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Bungalow'
),
(
	1017,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Cottage'
),
(
	1017,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Apartment'
),
(
	1017,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Duplex'
),
(
	1017,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Land'
),
(
	1017,
	'DROPDOWN',
	'PROPERTY_TYPE',
	'Site'
),
(
	1018,
	'DROPDOWN',
	'BEDS',
	'1'
),
(
	1018,
	'DROPDOWN',
	'BEDS',
	'2'
),
(
	1018,
	'DROPDOWN',
	'BEDS',
	'3'
),
(
	1018,
	'DROPDOWN',
	'BEDS',
	'4'
),
(
	1018,
	'DROPDOWN',
	'BEDS',
	'5'
),
(
	1018,
	'DROPDOWN',
	'BEDS',
	'6+'
),
(
	1019,
	'RADIO_BUTTON',
	'SIZE_YES',
	'Yes'
),
(
	1019,
	'RADIO_BUTTON',
	'SIZE_NO',
	'No'
),
(
	1020,
	'NUMBER',
	'SIZE_NUM',
	NULL
),
(
	1021,
	'RADIO_BUTTON',
	'SIZE_YES',
	'Yes'
),
(
	1021,
	'RADIO_BUTTON',
	'SIZE_NO',
	'No'
),
(
	1022,
	'NUMBER',
	'SIZE_NUM',
	NULL
),
(
	1023,
	'NONE',
	'NO_ANSWER',
	NULL
)

-----------------------------User Query-------------------------------------

INSERT INTO meta.question
(
	conversationID,
	questionType,
	questionKey,
	questionValue
)
VALUES
(
	14,
	'QUESTION',
	'QUE_QUERY',
	'Hey there! You seem like you want some help with accessing the application?'
),
(
	14,
	'QUESTION',
	'QUE_QUERY_LIST',
	'Here is a list of queries for which I can provide you an answer for:'
),
(
	14,
	'QUESTION',
	'QUE_QUERY_AGAIN',
	'<ANSWER> Do you require any further assistance?'
),
(
	14,
	'ASSERTION',
	'AS_GREAT_DAY',
	'Okay then, See ya! Have a great day!'
)


INSERT INTO meta.Answer
(
	questionID,
	answerType,
	answerKey,
	answerValue
)
VALUES
(
	1024,
	'RADIO_BUTTON',
	'SELECT_YES',
	'Yes'
),
(
	1024,
	'RADIO_BUTTON',
	'SELECT_NO',
	'No'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_WHAT_IPPI',
	'What is iPPi?'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_USE_IPPI',
	'How can I use iPPi?'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_ALSO_IPPI',
	'You can also use iPPi:'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_CONTACT_IPPI',
	'Contact iPPi:'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_REPORTS',
	'What reports are available in my market daily snapshot?'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_LONGER_TERM',
	'What Longer term market trends reports are available in iPPi?'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_MISSING_INCORRECT',
	'If I spot some missing or incorrect data, what can I do?'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_SOLD_HISTORY',
	'Sold History: How does this work?'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_MARKET_REPORT',
	'Market Report: How does this work?'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_APPRAISAL_REPORT',
	'Appraisal Report: How does this work?'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_INDEX_CALCULATION',
	'Indexes Calculations (rates and price changes): How does this work?'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_ESTIMATED_VALUE',
	'I don''t agree with your estimated value of property!'
),
(
	1025,
	'RADIO_BUTTON',
	'QUERY_OTHER',
	'Other'
),
(
	1026,
	'RADIO_BUTTON',
	'QUERY_AGAIN_YES',
	'Yes'
),
(
	1026,
	'RADIO_BUTTON',
	'QUERY_AGAIN_NO',
	'No'
),
(
	1027,
	'NONE',
	'QUERY_WHAT_IPPI',
	'iPPi is a digital platform which enables estate agents and valuers to analyse current and historical stock and prices of residential property in Ireland. iPPi collates complex independent datasets from multiple sources including the property price register and online listings to create an innovative platform that provides not only sold history listings but also property market reports showing current performance of the property market and identifies trends over time. iPPi’s independent index is game changing for property professionals.'
),
(
	1027,
	'NONE',
	'QUERY_USE_IPPI',
	'iPPi is a subscription based service that is delivered through any browser. You can use iPPi:
		To create a property market information dashboard for your local market
		To assess today’s market performance for your market
		To review long term price, availability and demand trends	
		To research and select appropriate comparables for property valuation
		To build a property appraisal informed by current market performance using comparables selected from the sold history database'
),
(
	1027,
	'NONE',
	'QUERY_ALSO_IPPI',
	'As business intelligence tool to identify opportunities and enhance decision making
	 As a branding and marketing tool through sharing and promoting property market trends from your market and through creating branded appraisals and market reports'
),
(
	1027,
	'NONE',
	'QUERY_CONTACT_IPPI',
	'To arrange a demo, report an issue or tell us how we can improve iPPi, please email us at ippi@4property.com or talk directly to a human on 01 497 7705.'
),
(
	1027,
	'NONE',
	'QUERY_REPORTS',
	'Number of properties for sale in your market and changes/month
	 Average days to sell in your market and changes/month
	 Average asking price
	 Average size in sqm
	 Average cost/sqm
	 Demand Index
	 Properties to rent
	 Average days to rent
	 Average Rental Price'
),
(
	1027,
	'NONE',
	'QUERY_LONGER_TERM',
	'Online vs Sold Average Prices
	 Average Price/Beds/Last 12 Months
	 Price Distribution of Sold Properties Last 12 Months
	 Average Price Last 12 Months
	 Average Price Per Sqm Last 12 months
	 Volume of Sales Last 12 months
	 Advertised vs sold properties statistics last 12 months
	 For sale online listings by beds and property type
	 Added listings
	 Delisted listings
	 New developments listings
	 Volume of sales last 12 months
	 Days to sell avg. Last 12 months
	 Avg. Visualizations before sale last 12 months
	 Volume of sales last 5 years
	 Withdrawn properties'
),
(
	1027,
	'NONE',
	'QUERY_MISSING_INCORRECT',
	'We have a feature on all listing pages where, if an agent spots an error or omission, they can create a challenge. If you submit information that improves the quality of the property details we will award your points for submitting valid corrections and with these you will be entered into a draw each quarter and recognised for your contribution. We greatly value and reward individual agent contributions as this improves the quality of the data on the platform, from which all users can benefit.

	 Using an iPPi report to win an instruction from a prospective vendor Using ippi can give you the data in a structure so you can backup your professional view on the value of a property and to advise on the optimal price to bring the property to market. You can mitigate other agents over valuing the property to unfairly win the instruction. The iPPi platform will produce a professional report that you can print and/or email to the prospective vendor.

	 Using iPPi for purchasers iPPi can also be used to produce a report for all prospective buyers coming to view a property. An iPPi report will give the purchaser a list of all properties that sold in the area close to the property on view.'
),
(
	1027,
	'NONE',
	'QUERY_SOLD_HISTORY',
	'We have taken all of the data from the Property Price Register and correlated it to all advertised residential property. The Property Price Registry lacks a lot of details that are essential to accurately valuing a residential property. We have resolved this issue by correlating all available data from our network and resources.'
),
(
	1027,
	'NONE',
	'QUERY_MARKET_REPORT',
	'iPPi is analysing all current listing stock and calculating in all areas the average price for 1-5+ beds.'
),
(
	1027,
	'NONE',
	'QUERY_APPRAISAL_REPORT',
	'We have created a simple 4 step workflow to all the valuers or agent to easily find comparables and calculate the €/sqM for property selling in the area. We then format this to create a professional valuation document that can then be produced in a PDF, printed and emailed.

	 Enter the property particulars - Enter property address, type, sqm, bedrooms and add photo or take a Google Street View picture
	 Select the comparables - You can add zero criteria or you can set criteria of price, radius for search and time period. You can also add in properties from your lists if you have created a list. You can view the selected comparable on Google Maps and click in to the map to view
	 Adjust the price and or range - iPPi calculates the mean price, average price per sqm of comparables and total price per sqm based on selected comparables. These figures are calculated purely as a guide to assist with your appraisal- they are not definitive valuations. Add your own valuation based on your professional judgement or choose a value range to definitively value the property
	 Add notes to your appraisal and generate your formatted and branded appraisal document - Save your appraisal as pdf, Email, Print or Share your appraisal'
),
(
	1027,
	'NONE',
	'QUERY_INDEX_CALCULATION',
	'We use different methods to calculate the variations of the data depending on this nature. Below we explain the main ones:

	 Avg. Price Changes (For sale and For rent Avg. Price changes) - We calculate it by comparing the current period with the same period of the past year. For example, the last month price change,let''s say, January 2019, is going to be compared with January of 2018 and the variation is calculated. The reason for using this formula is to remove the seasonality of the average.
	 Stocks(for rent and for sale) and days to sell - To calculate the variations of this information is used the comparison with the current period with the following past period. Let''s say the January of 2019 stock variation. It is compared with the December 2018 stock and the variation is presented. The same logic is used with the variation of Avg. days to sell variation and the avg. days to rent variation.
	 Avg. Price charts - All the charts related with price (avg. price and avg. sqm price) we do clean outliers. The formula to clean it is to remove the top 1% percentile and the bottom 1% percentile data.'
),
(
	1027,
	'NONE',
	'QUERY_ESTIMATED_VALUE',
	'An estimated value based on the cost per sqM or the mean of your selected comparables is not intended to be an official appraisal of your property value. We recommend using it as a starting point to determine a home''s value combined with other information on the site like the property''s attributes and particulars, comparable properties for sale and recently sold and other market statistics. We would however welcome any feedback you have so that we can continue to improve our estimates. Contact us at ippi@4property.com.'
)


--------------------------Feedback----------------------------------------------------------

INSERT INTO meta.question
(
	conversationID,
	questionType,
	questionKey,
	questionValue
)
VALUES
(
	15,
	'QUESTION',
	'QUE_IF_FEEDBACK',
	'Hello. It would be so great to know what you think about our application. Would you like to give a quick feedback?'
),
(
	15,
	'QUESTION',
	'QUE_FEEDBACK',
	'How would you rate us?'
),
(
	15,
	'QUESTION',
	'QUE_COMMENTS',
	'What do you think we can add to enhance your experience of our application?'
),
(
	15,
	'ASSERTION',
	'AS_INCENTIVE',
	'Thank you so much for helping us improve. In return, we are giving you a chance to win a brand new iPhone SE 2. We will keep you notified by E-mail. Have a great day!'
)

INSERT INTO meta.Answer
(
	questionID,
	answerType,
	answerKey,
	answerValue
)
VALUES
(
	1031,
	'RADIO_BUTTON',
	'SELECT_YES',
	'Yes'
),
(
	1031,
	'RADIO_BUTTON',
	'SELECT_NO',
	'No'
),
(
	1032,
	'RADIO_BUTTON',
	'RATING',
	'5 - Excellent'
),
(
	1032,
	'RADIO_BUTTON',
	'RATING',
	'4 - Very Good'
),
(
	1032,
	'RADIO_BUTTON',
	'RATING',
	'3 - Good'
),
(
	1032,
	'RADIO_BUTTON',
	'RATING',
	'2 - Bad'
),
(
	1032,
	'RADIO_BUTTON',
	'RATING',
	'1 - Very Bad'
),
(
	1033,
	'TEXT',
	'COMMENTS',
	NULL
),
(
	1034,
	'NONE',
	'NO_ANSWER',
	NULL
)