From: shuah at kernel.org (Shuah Khan)
Date: Wed, 26 Sep 2018 15:04:03 -0600
Subject: [V2 PATCH] selftests: watchdog: Add gettimeout and get|set
 pretimeout
In-Reply-To: <20180926200320.GB14558@anatevka.americas.hpqcorp.net>
References: <1537817767-78918-1-git-send-email-jerry.hoemann@hpe.com>
 <1537817767-78918-2-git-send-email-jerry.hoemann@hpe.com>
 <16941ebb-85ca-ad4c-de7b-c26f193ca611@kernel.org>
 <20180926162920.GB3948@anatevka.americas.hpqcorp.net>
 <ce60e815-10f1-08fd-d853-2629992a4a98@kernel.org>
 <20180926200320.GB14558@anatevka.americas.hpqcorp.net>
Message-ID: <07a8e98e-1e25-d87d-51e5-66ff9dd65245@kernel.org>

On 09/26/2018 02:03 PM, Jerry Hoemann wrote:
> On Wed, Sep 26, 2018 at 01:47:25PM -0600, Shuah Khan wrote:
>> On 09/26/2018 10:29 AM, Jerry Hoemann wrote:
>>> On Tue, Sep 25, 2018 at 02:51:15PM -0600, Shuah Khan wrote:
>>>> Hi Jerry,
>>>>
>>>>
>>>> The rest looks good to me.
>>
>> I spoke too soon. I ran your patch on softdog and error messages in unsupported
>> cases could you refinement. Please see below:
>>
>> Sorry for not catching this earlier.
>>
>>>>
>>>>>  }
>>>>>  
>>>>>  int main(int argc, char *argv[])
>>>>> @@ -135,6 +142,30 @@ int main(int argc, char *argv[])
>>>>>  			else
>>>>>  				printf("WDIOC_SETTIMEOUT errno '%s'\n", strerror(errno));
>>>>>  			break;
>>>>> +		case 'T':
>>>>> +			oneshot = 1;
>>>>> +			ret = ioctl(fd, WDIOC_GETTIMEOUT, &flags);
>>>>> +			if (!ret)
>>>>> +				printf("WDIOC_GETTIMEOUT returns %u seconds.\n", flags);
>>>>> +			else
>>>>> +				printf("WDIOC_GETTIMEOUT errno '%s'\n", strerror(errno));
>>
>> Either remove "errno" or change it to "error '%s'"
> 
> Oh, I see. I did a cut/paste from prior printf in file which have same issue.
> I'll fix those while I'm at it.
> 
> 
> 

Thanks. That will be awesome.

-- Shuah
