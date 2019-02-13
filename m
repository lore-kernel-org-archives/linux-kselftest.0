From: jarkko.sakkinen at linux.intel.com (Jarkko Sakkinen)
Date: Wed, 13 Feb 2019 17:13:23 +0200
Subject: [PATCH v2 2/2] selftests/tpm2: Extend tests to cover partial reads
In-Reply-To: <155001493022.13014.6810778681032295955.stgit@tstruk-mobl1.jf.intel.com>
References: <155001492513.13014.3572730050393346659.stgit@tstruk-mobl1.jf.intel.com>
 <155001493022.13014.6810778681032295955.stgit@tstruk-mobl1.jf.intel.com>
Message-ID: <9d3e78706b2fdbe0427f675592df5d7920d2c030.camel@linux.intel.com>

On Tue, 2019-02-12 at 15:42 -0800, Tadeusz Struk wrote:
> Three new tests added:
> 1. Send get random cmd, read header in 1st read, read the rest in second
>    read - expect success
> 2. Send get random cmd, read only part of the response, send another
>    get random command, read the response - expect success
> 3. Send get random cmd followed by another get random cmd, without
>    reading the first response - expect the second cmd to fail with -EBUSY
> 
> Signed-off-by: Tadeusz Struk <tadeusz.struk at intel.com>

Getting still some garbage in the output:

$ sudo ./test_smoke.sh 
[sudo] password for jsakkine: 
test_read_partial_overwrite (tpm2_tests.SmokeTest)
Reads only part of the response and issue a new cmd ... ok
test_read_partial_resp (tpm2_tests.SmokeTest)
Reads random in two subsequent reads ... ok
test_seal_with_auth (tpm2_tests.SmokeTest) ... ok
test_seal_with_policy (tpm2_tests.SmokeTest) ... ok
test_seal_with_too_long_auth (tpm2_tests.SmokeTest) ... ok
test_send_two_cmds (tpm2_tests.SmokeTest)
Send two cmds without reading a response ... ok
test_too_short_cmd (tpm2_tests.SmokeTest) ... ok
test_unseal_with_wrong_auth (tpm2_tests.SmokeTest) ... ok
test_unseal_with_wrong_policy (tpm2_tests.SmokeTest) ... ok

----------------------------------------------------------------------
Ran 9 tests in 47.374s

OK

Tested-by: Jarkko Sakkinen <jarkko.sakkinen at linux.intel.com>

Can give reviewed-by after those are cleaned up.

/Jarkko
