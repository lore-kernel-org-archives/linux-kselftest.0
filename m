From: brendanhiggins@google.com (Brendan Higgins)
Date: Thu, 2 May 2019 22:48:16 -0700
Subject: [PATCH v2 04/17] kunit: test: add kunit_stream a std::stream like
 logger
In-Reply-To: <ead23600-eecd-cf74-bdd1-94a6964e29b2@kernel.org>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-5-brendanhiggins@google.com>
 <ead23600-eecd-cf74-bdd1-94a6964e29b2@kernel.org>
Message-ID:
 <CAFd5g463PQGn3618Vo2Spu81zzL40jM6Skr1gSWtJqMx7Faj5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503054816.HnhxbtBl0VR3am07R78LPn4kGpLAGMGdF6j6ml61MVk@z>

On Thu, May 2, 2019@6:50 PM shuah <shuah@kernel.org> wrote:
>
> On 5/1/19 5:01 PM, Brendan Higgins wrote:

< snip >

> > diff --git a/kunit/kunit-stream.c b/kunit/kunit-stream.c
> > new file mode 100644
> > index 0000000000000..93c14eec03844
> > --- /dev/null
> > +++ b/kunit/kunit-stream.c
> > @@ -0,0 +1,149 @@

< snip >

> > +static int kunit_stream_init(struct kunit_resource *res, void *context)
> > +{
> > +     struct kunit *test = context;
> > +     struct kunit_stream *stream;
> > +
> > +     stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> > +     if (!stream)
> > +             return -ENOMEM;
> > +     res->allocation = stream;
> > +     stream->test = test;
> > +     spin_lock_init(&stream->lock);
> > +     stream->internal_stream = new_string_stream();
> > +
> > +     if (!stream->internal_stream)
> > +             return -ENOMEM;
>
> What happens to stream? Don't you want to free that?

Good catch. Will fix in next revision.

< snip >

Cheers
