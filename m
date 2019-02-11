From: mcgrof at kernel.org (Luis Chamberlain)
Date: Mon, 11 Feb 2019 13:40:02 -0800
Subject: [PATCH v2] selftests: kmod: worked on errors which breaks the
 overall execution of the test script. i have manually edited for v2 of the
 patch by changing the date and also commit log.
In-Reply-To: <20190131183109.10919-1-jeffrin@rajagiritech.edu.in>
References: <20190131183109.10919-1-jeffrin@rajagiritech.edu.in>
Message-ID: <20190211214002.GV11489@garbanzo.do-not-panic.com>

Your subject is too long.

On Fri, Feb 01, 2019 at 12:01:09AM +0530, Jeffrin Jose T wrote:
> The kmod.sh script breaks because an array is passed as input
> instead of a single element input.This patch takes elements
> one at a time and passed as input to the condition statement
> which in turn fixes the error.There was an issue which had
> the need for passing a single digit to the condition statement
> which is fixed using regular expression.
> Distribution: Debian GNU/Linux buster/sid
> Bash Version: 5.0.0(1)-release

I just tried Debian unstabe with bash 5.0-2 and the issue is not
present there. Debian testing was on 4.4.18-3.1 for me prior to
the upgrade.

*both* work fine.

Please upgrade bash?

  Luis
