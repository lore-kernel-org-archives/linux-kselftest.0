From: brendanhiggins@google.com (Brendan Higgins)
Date: Thu, 21 Mar 2019 18:45:08 -0700
Subject: [RFC v4 16/17] of: unittest: split out a couple of test cases
 from unittest
In-Reply-To: <dd0c4033-183b-9e77-1dee-7c88f62771fa@gmail.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <20190214213729.21702-17-brendanhiggins@google.com>
 <dd0c4033-183b-9e77-1dee-7c88f62771fa@gmail.com>
Message-ID:
 <CAFd5g45QnvgyoAGcSQe0E3P1U=qsrRe4uCqXTNCroobmbUH0ng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190322014508.1Qjz5Hh9PtCczaeuqjlHM1gEpVN3s60RNUFC31cKm5A@z>

On Thu, Mar 21, 2019@6:15 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 2/14/19 1:37 PM, Brendan Higgins wrote:
> > Split out a couple of test cases that these features in base.c from the
> > unittest.c monolith. The intention is that we will eventually split out
> > all test cases and group them together based on what portion of device
> > tree they test.
>
> I still object to this patch.  I do not want this code scattered into
> additional files.

Sure, no problem. I will remove this from future revisions.
