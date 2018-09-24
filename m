From: shuah at kernel.org (Shuah Khan)
Date: Mon, 24 Sep 2018 15:36:56 -0600
Subject: [RFC 16/20] selftest: Add Time Namespace test for supported clocks
In-Reply-To: <20180919205037.9574-17-dima@arista.com>
References: <20180919205037.9574-1-dima@arista.com>
 <20180919205037.9574-17-dima@arista.com>
Message-ID: <741594c9-2247-3cde-5da9-ae8cc41854b6@kernel.org>

Hi Dmitry,

Thanks for adding tests with the kernel changes.

On 09/19/2018 02:50 PM, Dmitry Safonov wrote:
> This test checks that all supported clocks can be changed by
> clock_settime.

It would good to elaborate a bit more on the nature of the tests in the
here. Also a few things to consider.

I noticed that this test isn't added to selftests/Makefile as TARGET. If it is
an oversight, please make that change as well. If not, it is fine.

Please make sure if the test can't be run because of unmet dependencies, the test
will exit with KSFT_SKIP as opposed to an error. Dependencies include configuration,
privilege, any other unsupported conditions.

This is a comment applies to all the test patches in this series.

thanks,
-- Shuah
