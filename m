From: idosch@idosch.org (Ido Schimmel)
Date: Tue, 21 Aug 2018 21:56:25 +0300
Subject: [PATCH] selftests: net: move fragment forwarding/config up a level
In-Reply-To: <20180821161212.5750-1-anders.roxell@linaro.org>
References: <20180821161212.5750-1-anders.roxell@linaro.org>
Message-ID: <20180821185625.GB27078@splinter>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180821185625.9vm8nfJ2uMTJkWWrQ2go8j6I-D4Mk0eSqNBOXvB9fzo@z>

On Tue, Aug 21, 2018@06:12:12PM +0200, Anders Roxell wrote:
> 'make kselftest-merge' assumes that the config files for the tests are
> located under the 'main' tet dir, like tools/testing/selftests/net/ and
> not in a subdir to net.

The tests under tools/testing/selftests/net/forwarding/ aren't executed
as part of the Makefile. The config file is there mainly so that people
will know which config options they need in order to run the tests.

The tests can be added to the Makefile, but some of them take a few
minutes to complete which is probably against "Don't take too long;"
mentioned in Documentation/dev-tools/kselftest.rst.
