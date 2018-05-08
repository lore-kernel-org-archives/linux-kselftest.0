From: shuah at kernel.org (Shuah Khan)
Date: Tue, 8 May 2018 11:36:17 -0600
Subject: [PATCH 2/2] tools/testing/selftests/x86: fix error: conflicting
 types for 'pkey_get|pkey_set'
In-Reply-To: <125eb810-1d48-394d-9665-40da64326fbb@intel.com>
References: <1525770870-19067-1-git-send-email-lizhijian@cn.fujitsu.com>
 <1525770870-19067-2-git-send-email-lizhijian@cn.fujitsu.com>
 <125eb810-1d48-394d-9665-40da64326fbb@intel.com>
Message-ID: <e80c9430-eaed-6a46-bde2-141b2e4266d2@kernel.org>

On 05/08/2018 10:30 AM, Dave Hansen wrote:
> On 05/08/2018 02:14 AM, Li Zhijian wrote:
>> -u32 pkey_get(int pkey, unsigned long flags)
>> +u32 _pkey_get(int pkey, unsigned long flags)
>>  {
>>  	u32 mask = (PKEY_DISABLE_ACCESS|PKEY_DISABLE_WRITE);
>>  	u32 pkru = __rdpkru();
>> @@ -422,7 +426,7 @@ u32 pkey_get(int pkey, unsigned long flags)
>>  	return masked_pkru;
>>  }
> 
> I'm not a huge fan of random underscores for undocumented reasons.  But,
> oh well.
> 
> Acked-by: Dave Hansen <dave.hansen at intel.com>
> 

Thanks. Queuing this up for 4.17-rc5

-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
