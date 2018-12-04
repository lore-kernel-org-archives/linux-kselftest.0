From: frowand.list@gmail.com (Frank Rowand)
Date: Tue, 4 Dec 2018 02:56:10 -0800
Subject: [RFC v3 17/19] of: unittest: migrate tests to run on KUnit
In-Reply-To: <20181128193636.254378-18-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-18-brendanhiggins@google.com>
Message-ID: <630d0c82-401e-28f8-73fc-6e684ec57bbf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181204105610.V-Sshoka6yjv0ImVawtmhJvAUdwIHVqolNSwJR5w-Lw@z>

On 11/28/18 11:36 AM, Brendan Higgins wrote:
> Migrate tests without any cleanup, or modifying test logic in anyway to
> run under KUnit using the KUnit expectation and assertion API.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> ---
>  drivers/of/Kconfig    |    1 +
>  drivers/of/unittest.c | 1405 ++++++++++++++++++++++-------------------
>  2 files changed, 752 insertions(+), 654 deletions(-)

< snip >

I am travelling and will not have an opportunity to properly review this
patch, patch 18, or patch 19 until next week.

-Frank
