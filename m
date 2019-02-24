From: davem@davemloft.net (David Miller)
Date: Sat, 23 Feb 2019 18:34:35 -0800 (PST)
Subject: [PATCH] selftests: fib_tests: sleep after changing carrier. again.
In-Reply-To: <20190222102741.31173-1-cascardo@canonical.com>
References: <20190222102741.31173-1-cascardo@canonical.com>
Message-ID: <20190223.183435.22949869818395441.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190224023435.t7zqkWzmFdtnQxtGg_JePccC4rItgepKf0VpV8pFud0@z>

From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Date: Fri, 22 Feb 2019 07:27:41 -0300

> Just like commit e2ba732a1681 ("selftests: fib_tests: sleep after
> changing carrier"), wait one second to allow linkwatch to propagate the
> carrier change to the stack.
> 
> There are two sets of carrier tests. The first slept after the carrier
> was set to off, and when the second set ran, it was likely that the
> linkwatch would be able to run again without much delay, reducing the
> likelihood of a race. However, if you run 'fib_tests.sh -t carrier' on a
> loop, you will quickly notice the failures.
> 
> Sleeping on the second set of tests make the failures go away.
> 
> Cc: David Ahern <dsahern at gmail.com>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo at canonical.com>

Applied, thanks.
