From: mcgrof at kernel.org (Luis Chamberlain)
Date: Thu, 29 Nov 2018 19:40:01 -0800
Subject: [RFC v3 07/19] kunit: test: add initial tests
In-Reply-To: <20181128193636.254378-8-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-8-brendanhiggins@google.com>
Message-ID: <20181130034001.GM18410@garbanzo.do-not-panic.com>

On Wed, Nov 28, 2018 at 11:36:24AM -0800, Brendan Higgins wrote:
> Add a test for string stream along with a simpler example.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> ---
>  kunit/Kconfig              | 12 ++++++
>  kunit/Makefile             |  4 ++
>  kunit/example-test.c       | 88 ++++++++++++++++++++++++++++++++++++++

BTW if you need another more concrete but very simple example I think it
may be possible to port tools/testing/selftests/sysctl/sysctl.sh +
lib/test_sysctl.c into a kunit test. Correct me if I'm wrong.

I think that would show the differences clearly between selftests and
kunit as well.

  Luis
