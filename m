From: elfring@users.sourceforge.net (SF Markus Elfring)
Date: Tue, 21 Nov 2017 19:46:46 +0100
Subject: [Linux-kselftest-mirror] [PATCH] selftests: posix_timers: Use
 common error handling code in two functions
In-Reply-To: <abce4f4e-a904-9bfe-7021-3cfd230d52ea@kernel.org>
References: <3ce187fa-a6df-a419-6924-ea12bf837972@users.sourceforge.net>
 <abce4f4e-a904-9bfe-7021-3cfd230d52ea@kernel.org>
Message-ID: <26ab24f1-cc65-17c1-2284-84cf5970506d@users.sourceforge.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171121184646.vo-9U3iTRF_RmuafAH9hgcp25GtKi36KHUf9DTLuNGA@z>

>> Add jump targets so that a bit of exception handling can be better reused
>> at the end of these functions.
>>
>> This issue was detected by using the Coccinelle software.
> 
> Please include Coccinelle report in the change log.

I guess that I can not append the kind of report you might be looking for
so far. This small update suggestion is just another result from one
of my evolving scripts for the semantic patch language.

It was discussed under the topic “Comparing statement lists with SmPL”
to some degree.
https://systeme.lip6.fr/pipermail/cocci/2017-August/004388.html


>> @@ -104,10 +104,8 @@ static int check_itimer(int which)
>>  		signal(SIGALRM, sig_handler);
>>  
>>  	err = gettimeofday(&start, NULL);
>> -	if (err < 0) {
>> -		perror("Can't call gettimeofday()\n");
>> -		return -1;
>> -	}
>> +	if (err < 0)
>> +		goto report_failure;
> 
> Instead of report_failure, makes this specific to the failure.
> Something like, gettimeofday_error

Would you like to achieve unique error messages in this use case?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
