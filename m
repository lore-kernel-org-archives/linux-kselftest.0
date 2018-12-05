From: brendanhiggins@google.com (Brendan Higgins)
Date: Wed, 5 Dec 2018 15:54:34 -0800
Subject: [RFC v3 18/19] of: unittest: split out a couple of test cases
 from unittest
In-Reply-To: <990bfc7d-dc5e-d8d3-c151-9b321ff2ac10@gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-19-brendanhiggins@google.com>
 <990bfc7d-dc5e-d8d3-c151-9b321ff2ac10@gmail.com>
Message-ID:
 <CAFd5g45tOGgf_sKGYRC=fpnTBKGaG=8frbQdgZ3ZTkQFyTfP5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181205235434.GRXgNiwfjbFWU0pkP8IO1bHQTDt5Hm2dKkvvvS1Gxio@z>

On Tue, Dec 4, 2018@2:58 AM Frank Rowand <frowand.list@gmail.com> wrote:
>
> Hi Brendan,
>
> On 11/28/18 11:36 AM, Brendan Higgins wrote:
> > Split out a couple of test cases that these features in base.c from the
> > unittest.c monolith. The intention is that we will eventually split out
> > all test cases and group them together based on what portion of device
> > tree they test.
>
> Why does splitting this file apart improve the implementation?

This is in preparation for patch 19/19 and other hypothetical future
patches where test cases are split up and grouped together by what
portion of DT they test (for example the parsing tests and the
platform/device tests would probably go separate files as well). This
patch by itself does not do anything useful, but I figured it made
patch 19/19 (and, if you like what I am doing, subsequent patches)
easier to review.
