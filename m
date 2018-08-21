From: shuah at kernel.org (Shuah Khan)
Date: Tue, 21 Aug 2018 13:41:54 -0600
Subject: [PATCH] selftests: net: move fragment forwarding/config up a level
In-Reply-To: <20180821185625.GB27078@splinter>
References: <20180821161212.5750-1-anders.roxell@linaro.org>
 <20180821185625.GB27078@splinter>
Message-ID: <fa188bdd-2f4c-66fc-a803-5d53425c3daf@kernel.org>

On 08/21/2018 12:56 PM, Ido Schimmel wrote:
> On Tue, Aug 21, 2018 at 06:12:12PM +0200, Anders Roxell wrote:
>> 'make kselftest-merge' assumes that the config files for the tests are
>> located under the 'main' tet dir, like tools/testing/selftests/net/ and
>> not in a subdir to net.
> 
> The tests under tools/testing/selftests/net/forwarding/ aren't executed
> as part of the Makefile. The config file is there mainly so that people
> will know which config options they need in order to run the tests.
> 
> The tests can be added to the Makefile, but some of them take a few
> minutes to complete which is probably against "Don't take too long;"
> mentioned in Documentation/dev-tools/kselftest.rst.
> 

I don't see any reason why these shouldn't be added. With the number of
tests that get run by default, time has gone up. The goal is to run more
tests not less. There are some stress/destructive tests that continue to
be left out of the Makefile.

thanks,
-- Shuah
