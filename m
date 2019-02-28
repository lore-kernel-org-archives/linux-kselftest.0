From: dan.carpenter at oracle.com (Dan Carpenter)
Date: Thu, 28 Feb 2019 16:54:03 +0300
Subject: [RFC v4 08/17] kunit: test: add support for test abort
In-Reply-To: <CAFd5g46QCisA4PHQXo57-LC6sNdk=OUjBE0O1s4005uBz_Vo6Q@mail.gmail.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <20190214213729.21702-9-brendanhiggins@google.com>
 <155121334527.260864.5324117081460979741@swboyd.mtv.corp.google.com>
 <CAFd5g46QCisA4PHQXo57-LC6sNdk=OUjBE0O1s4005uBz_Vo6Q@mail.gmail.com>
Message-ID: <20190228135403.GD9806@kadam>

On Thu, Feb 28, 2019 at 01:03:24AM -0800, Brendan Higgins wrote:
> you could do:
> 
> if (IS_ERR_OR_NULL(ptr)) {
>         KUNIT_FAIL(test, "ptr is an errno or null: %ld", ptr);
>         return;
> }

It's best to not mix error pointers and NULL but when we do mix them,
it means that NULL is a special kind of success.  Like we try to load
a feature and we get back:

    valid pointer <-- success
    null          <-- feature is disabled.  not an error.
    error pointer <-- feature is broken.  fail.

regards,
dan carpenter
