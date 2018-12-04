From: frowand.list@gmail.com (Frank Rowand)
Date: Tue, 4 Dec 2018 02:58:28 -0800
Subject: [RFC v3 18/19] of: unittest: split out a couple of test cases
 from unittest
In-Reply-To: <20181128193636.254378-19-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-19-brendanhiggins@google.com>
Message-ID: <990bfc7d-dc5e-d8d3-c151-9b321ff2ac10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181204105828.6nOfiDkGwCYlVkDn67ydW_Z2Qjz_SDxM7P8apkUcaOs@z>

Hi Brendan,

On 11/28/18 11:36 AM, Brendan Higgins wrote:
> Split out a couple of test cases that these features in base.c from the
> unittest.c monolith. The intention is that we will eventually split out
> all test cases and group them together based on what portion of device
> tree they test.

Why does splitting this file apart improve the implementation?


> 
> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> ---
>  drivers/of/Makefile      |   2 +-
>  drivers/of/base-test.c   | 214 ++++++++++++++++++++++++++
>  drivers/of/test-common.c | 149 ++++++++++++++++++
>  drivers/of/test-common.h |  16 ++
>  drivers/of/unittest.c    | 316 +--------------------------------------
>  5 files changed, 381 insertions(+), 316 deletions(-)
>  create mode 100644 drivers/of/base-test.c
>  create mode 100644 drivers/of/test-common.c
>  create mode 100644 drivers/of/test-common.h
>
< snip >

-Frank
