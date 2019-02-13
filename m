From: tadeusz.struk@intel.com (Tadeusz Struk)
Date: Wed, 13 Feb 2019 08:27:44 -0800
Subject: [PATCH v2 2/2] selftests/tpm2: Extend tests to cover partial reads
In-Reply-To: <9d3e78706b2fdbe0427f675592df5d7920d2c030.camel@linux.intel.com>
References: <155001492513.13014.3572730050393346659.stgit@tstruk-mobl1.jf.intel.com>
 <155001493022.13014.6810778681032295955.stgit@tstruk-mobl1.jf.intel.com>
 <9d3e78706b2fdbe0427f675592df5d7920d2c030.camel@linux.intel.com>
Message-ID: <dc02e064-9c95-cb51-60d8-4a6219f77430@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190213162744.avml4LwusHBszoEEY1Xe2QQXyDyVc3Ww8Ip31PcYM7A@z>

On 2/13/19 7:13 AM, Jarkko Sakkinen wrote:
> On Tue, 2019-02-12@15:42 -0800, Tadeusz Struk wrote:
>> Three new tests added:
>> 1. Send get random cmd, read header in 1st read, read the rest in second
>>    read - expect success
>> 2. Send get random cmd, read only part of the response, send another
>>    get random command, read the response - expect success
>> 3. Send get random cmd followed by another get random cmd, without
>>    reading the first response - expect the second cmd to fail with -EBUSY
>>
>> Signed-off-by: Tadeusz Struk <tadeusz.struk at intel.com>
> 
> Getting still some garbage in the output:
> 
> $ sudo ./test_smoke.sh 
> [sudo] password for jsakkine: 
> test_read_partial_overwrite (tpm2_tests.SmokeTest)
> Reads only part of the response and issue a new cmd ... ok
> test_read_partial_resp (tpm2_tests.SmokeTest)
> Reads random in two subsequent reads ... ok
> test_seal_with_auth (tpm2_tests.SmokeTest) ... ok
> test_seal_with_policy (tpm2_tests.SmokeTest) ... ok
> test_seal_with_too_long_auth (tpm2_tests.SmokeTest) ... ok
> test_send_two_cmds (tpm2_tests.SmokeTest)
> Send two cmds without reading a response ... ok
> test_too_short_cmd (tpm2_tests.SmokeTest) ... ok
> test_unseal_with_wrong_auth (tpm2_tests.SmokeTest) ... ok
> test_unseal_with_wrong_policy (tpm2_tests.SmokeTest) ... ok

Looks like python unittest prints out the docstrings:

+    def test_read_partial_resp(self):
+        """Reads random in two subsequent reads"""

I can remove them if it makes more difficult to process the output.
Thanks,
-- 
Tadeusz
