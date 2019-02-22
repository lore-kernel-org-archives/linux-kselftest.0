From: juerg.haefliger@canonical.com (Juerg Haefliger)
Date: Fri, 22 Feb 2019 21:52:35 +0100
Subject: [RESEND PATCH v2 0/2] selftests/ftrace: Make ftracetest POSIX
 compliant
In-Reply-To: <20190222091021.10178-1-juergh@canonical.com>
References: <20190222091021.10178-1-juergh@canonical.com>
Message-ID: <20190222205237.606-1-juergh@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190222205235.uZnSBzP-g25BZuC33AJrvGUSCrrphLaXh3CQ09XkRCM@z>

Add shuah at kernel.org and linux-kselftest at vger.kernel.org.

The recent addition of colored output introduced some non-POSIX-compliant
constructs. Fix that.

Juerg Haefliger (2):
  selftests/ftrace: Replace echo -e with printf
  selftests/ftrace: Replace \e with \033

 tools/testing/selftests/ftrace/ftracetest | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
2.19.1
