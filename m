From: bauerman at linux.vnet.ibm.com (Thiago Jung Bauermann)
Date: Wed, 28 Mar 2018 17:47:04 -0300
Subject: [PATCH v12 07/22] selftests/vm: fixed bugs in pkey_disable_clear()
In-Reply-To: <dc5ee0c8-afe3-78aa-001d-7b49b398337b@intel.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-8-git-send-email-linuxram@us.ibm.com>
 <dc5ee0c8-afe3-78aa-001d-7b49b398337b@intel.com>
Message-ID: <87muys3p2v.fsf@morokweng.localdomain>


Dave Hansen <dave.hansen at intel.com> writes:

> On 02/21/2018 05:55 PM, Ram Pai wrote:
>> --- a/tools/testing/selftests/vm/protection_keys.c
>> +++ b/tools/testing/selftests/vm/protection_keys.c
>> @@ -461,7 +461,7 @@ void pkey_disable_clear(int pkey, int flags)
>>  			pkey, pkey, pkey_rights);
>>  	pkey_assert(pkey_rights >= 0);
>>
>> -	pkey_rights |= flags;
>> +	pkey_rights &= ~flags;
>>
>>  	ret = pkey_set(pkey, pkey_rights, 0);
>>  	/* pkey_reg and flags have the same format */
>> @@ -475,7 +475,7 @@ void pkey_disable_clear(int pkey, int flags)
>>  	dprintf1("%s(%d) pkey_reg: 0x%016lx\n", __func__,
>>  			pkey, rdpkey_reg());
>>  	if (flags)
>> -		assert(rdpkey_reg() > orig_pkey_reg);
>> +		assert(rdpkey_reg() < orig_pkey_reg);
>>  }
>>
>>  void pkey_write_allow(int pkey)
>
> This seems so horribly wrong that I wonder how it worked in the first
> place.  Any idea?

The code simply wasn't used. pkey_disable_clear() is called by
pkey_write_allow() and pkey_access_allow(), but before this patch series
nothing called either of these functions.


--
Thiago Jung Bauermann
IBM Linux Technology Center

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
