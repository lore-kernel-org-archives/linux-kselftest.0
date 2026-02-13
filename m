Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAF736405E
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 17:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771002849; cv=pass; b=GYbWviUao0ml5CtqXLYfpCUJDtgWsi3BraYuLL07w+AU6awMYJBNLnrd+FcBb47Wg4TYdem9yLIObLHEktcaULG+W9q3Nrg1tJ3lhx/s1msGCjsMg6o+aawI813yXJEDRm12kvZhE/ADlBSqR0s8kciPJ/sdP2l6k0w5v2Uob8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771002849; c=relaxed/simple;
	bh=3eyyW+vRU09CEScy4G1JdDlh19izB4UbxnvRukE2JSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQ2WzQdlVCn+ZZQd2qEudeLDyGamobpRLGGZXtmCJF8ApPhWHxIgfcLU5MyatbDkkuswa6MZuN2T530w2PDENKCmEXaBHv6Sfrc0xbS0wviRUAF2ndtQp497JREJ1AkQ6RQjDee40qEfbGA2Us80ws20juy9kFBRtVxTzF+AXUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Whr8Y2Cd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FM+Dy5Av; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Whr8Y2Cd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FM+Dy5Av"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771002846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=48MPXs8uydZg3IJ9byQcByCwujOFhfoWvJ4s77ZzRZI=;
	b=Whr8Y2CdmlGrenDIzsMV2++iD+6BHW50szaoscP6FgzL+C87fWXEXzc6s6se9IjikGmptK
	2FTAkNzbSeBQayOPMs54f+AaPGAWP2yFwFmzvhYMluTadfWgrlSOfV3A/8ypvxnJzomyLy
	dyFQj23LxmieNDm7VJmWccGM/qx6XXs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-BkiEY2EUNy628dIuYUe_Iw-1; Fri, 13 Feb 2026 12:14:04 -0500
X-MC-Unique: BkiEY2EUNy628dIuYUe_Iw-1
X-Mimecast-MFC-AGG-ID: BkiEY2EUNy628dIuYUe_Iw_1771002844
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-503810dba87so69002141cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 09:14:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771002844; cv=none;
        d=google.com; s=arc-20240605;
        b=AC7Oym5RDjqGYS9I2wuro+DlUd/KEzOyKApt6kOeIvNTFvi7TUwOm3t/6c3icVNfdl
         xmsCY7bXZ9MwRKpcQP6/CW7uzZua1h86NnpcMxomEoi9kjXD4aeZ1jXwTkHAsXRLdwqE
         9qHCjzTcYjULdMU0tCv8dRyFHxdaYQvnrioOKvTp5/UaToCo5EPvEs7Ft/a0FoCITjky
         rdBkAM7Uw4+O4ktKKbMYjsYD8zoZPs3QFSY89MvFIgf7af6Kg5j9b+fnAZwlqwMPlsvv
         WWw4MeAGagNfGKyzPE438gBX+eR+gI8v8lqn4gCm5K6jDyexdW3td5CNkGfYrHmjTREa
         zQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=48MPXs8uydZg3IJ9byQcByCwujOFhfoWvJ4s77ZzRZI=;
        fh=q2wGcFiT4hOUefkQn31kEqYE9hLXsxahwiE9aGNGW0I=;
        b=OdhBk4rmc78TkP+SbhrTqgVqfp5KDCvBsAvvJfzuTwKIi87i/2bx601vU9uOhR9NTQ
         YQ0Y4S9blJ2lxaRcBzJ8e51Tb6F0VmMiMQcoSTYplksa9EkAXBkTyHfEUhxmkI0BsKJg
         V2z9kDFSQc5TbfXOZ/tSOXwVaVKdNNz50npDbRIL15FWeeV1p2mjCitoeGjXoTWP4FYH
         ZBBzBJdybKPzzenwLnS1D/a9w9AXHXP8dOAIwGpvB8rYQaeu5s3Miv/aBcci2xEHbyWF
         V80fzG68GFY0h4acV2cto2Ot6q7CmFCmlWz1CF5nXjBe1Vmgp3sgR2+U1plO9OY3BRMZ
         1gSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771002844; x=1771607644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48MPXs8uydZg3IJ9byQcByCwujOFhfoWvJ4s77ZzRZI=;
        b=FM+Dy5AvvHWQpj4k/tWwcg7Bibj1XRnMwgW/tkUzpD8qo8/Z1NfcEOUgDFh06CVx4v
         LYRkw/hUg0SwCQI0Zq5ToQSL+wYE8hWcIXKtGWjYx3Gx5U2LDLYY079QqnvUqIVrYpDI
         yniWTZN1wCVZwjUgVnzUmbuLLJNLWM+aLuE7pQtU5YRH7xYPOaY0eLWS9jKWPaFqoKiR
         2E6m5h0trE8OtiOkKMI8Jopj4vyonI/8KzGono/L3Z4t0DXbJ331rS43LJuQ9gQrMWhi
         NDWGQel+a1EE12/tsZ/9KPaoeSrbgMUWm/qkXoqHNWXySf/hGJxEwszhtBrogFYDFoIP
         phbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771002844; x=1771607644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=48MPXs8uydZg3IJ9byQcByCwujOFhfoWvJ4s77ZzRZI=;
        b=Jti+lYqQyEAkyfpgoFjaJngA57501+5MLpcy1E3glji5cpZAM/hJZadL3o4ax0h4Sn
         HYu8cWuE4AK6i5LfOW2O9L+aI7pUCBrawcPbUoZFh2RX3JwX3YoqGloV3aJ4q5ewC2TC
         +fvPKxrdjdVpC4HZ3uqad+T0pM22K4E/7yK/QyL8GFnjchmWAsNQ4P4Gxjtr9B/6ryJV
         wHJRMcI5QadEh8x90lJpoxYZfP9UMkVabcO4zmQxmZE0N3MwGUniz6LYDS63Twjuh2BP
         BFjeL4FVvtUeOK6zMWdn+bYyGvr0iFo+Z2uikjfCJccPsmhmFiBCxaA/6nTqzPYVShjB
         bwQw==
X-Forwarded-Encrypted: i=1; AJvYcCU7oFO/trezwGh7hA58u8jsx3WaEWNpuR+M7FGa6izCjGUZMrtxbcUwCea72wcHFzxWe9kL9xmXSZCg+yFKxQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7f/+zCNGHZiK8zvaQ1FcCKGy+1Pvl8GVkxrHk8o+Rf5Noxnmv
	R052ITqRwyFVlmg0iyjO78VyWsSe0B77Vmz5sDLkeTsopYkzszD0Pd0AtAhebM+cJYDa9QqS3YZ
	jvGFOJjas/wjzLcF65SU3OgkAwJHfI6O+2RfvHCJ7QJi/87q8dj6V6I9PAyDiBhLffT0djzPhqa
	KBTfC+YK4p095c1CAcFB6aYsZfzzPign/9f/gs5aT+Fcxf
X-Gm-Gg: AZuq6aKsVZ4neFCLmZ5jMYg3LvTW49r4sHxFzFElg2gB1AJyCBfW0W2uEmsiN/oRVCw
	CjtNLfTx+OZ9E/nmGFuSZ5jRTiFTeCpNCLZC5H2OMW4o7fGvNeIf2spHVZ5c9w8gS9T/alf4JBf
	Dw1g74aajD2cQfo+zZgqnUugeMQFRIxqNZ+6Gcs4wHoojHpuZtxa1yl9eYNKRbA2oRHKn6n78Oj
	50L3CbZkoBqHiBQAtJnd9GaLQA1rlH1xzMJmNM=
X-Received: by 2002:ac8:58d2:0:b0:501:4e87:70b7 with SMTP id d75a77b69052e-506b3f7dafcmr2115831cf.1.1771002844073;
        Fri, 13 Feb 2026 09:14:04 -0800 (PST)
X-Received: by 2002:ac8:58d2:0:b0:501:4e87:70b7 with SMTP id
 d75a77b69052e-506b3f7dafcmr2115341cf.1.1771002843486; Fri, 13 Feb 2026
 09:14:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212124923.222484-1-gpaoloni@redhat.com> <20260212124923.222484-2-gpaoloni@redhat.com>
 <2026021221-grading-clatter-b7bf@gregkh> <CA+wEVJaFX4AE5ruKLvgYZhmNsOabovLp=2LAaLUYe5B9r51qEA@mail.gmail.com>
 <2026021207-hatchery-spore-2800@gregkh>
In-Reply-To: <2026021207-hatchery-spore-2800@gregkh>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Fri, 13 Feb 2026 18:13:51 +0100
X-Gm-Features: AZwV_QiiIwRP90JuNH3-RopOFaXtZYGeRpSsElT4AgkFJTEVPZTkMgMRh4ssB44
Message-ID: <CA+wEVJbhtDD2G4V=auecrcTmO9s7bE8VagjMmoPaetASJAh0Vw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/6] Documentation: extend the 'Function
 documentation' with expected behavior and constraints of use
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de, 
	brendan.higgins@linux.dev, raemoar63@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, acarminati@nvidia.com, linux-mm@kvack.org, 
	safety-architecture@lists.elisa.tech, kstewart@linuxfoundation.org, 
	chuckwolber@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 4:23=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Feb 12, 2026 at 03:00:01PM +0100, Gabriele Paoloni wrote:
> > On Thu, Feb 12, 2026 at 1:59=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Thu, Feb 12, 2026 at 01:49:18PM +0100, Gabriele Paoloni wrote:
> > > > Extend the longer description section of a function kernel-doc
> > > > header with an itemised list of function's behaviors and
> > > > constraints of use.
> > > > These are useful to link and trace test cases (e.g. KUnit) to
> > > > the different behavior IDs and define the constraints to be
> > > > met by the function's caller.
> > > >
> > > > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > > > ---
> > > >  Documentation/doc-guide/kernel-doc.rst | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation=
/doc-guide/kernel-doc.rst
> > > > index 8d2c09fb36e4..23e6c4b45b14 100644
> > > > --- a/Documentation/doc-guide/kernel-doc.rst
> > > > +++ b/Documentation/doc-guide/kernel-doc.rst
> > > > @@ -83,6 +83,25 @@ The general format of a function and function-li=
ke macro kernel-doc comment is::
> > > >     *
> > > >     * The longer description may have multiple paragraphs.
> > > >     *
> > > > +   * When specifying testable code behaviour the longer descriptio=
n must contain
> > > > +   * a paragraph formatted as follows:
> > > > +   *
> > > > +   * function_name behavior:
> > > > +   * [ID1] - [expected behavior]
> > > > +   *
> > > > +   * [ID2] - [expected behavior]
> > > > +   *
> > > > +   * [...]
> > > > +   *
> > > > +   * [IDn] - [expected behavior]
> > > > +   *
> > > > +   * function_name constraints of use:
> > > > +   * [ID1] - [constraint to be met by the caller]
> > > > +   *
> > > > +   * [ID2] - [constraint to be met by the caller]
> > > > +   *
> > > > +   * [IDn] - [constraint to be met by the caller]
> > >
> > > So the same "id" is used for a behavior, AND a constraint?
> >
> > The idea is to have a specific behaviour or constraint of use
> > identified by the tuple [function_name behavior][ID].
> > So I think we could have a problem for duplicated symbols (but
> > it is a sort of corner case...)
>
> I am trying to say that you have ID1 listed in two places above.  So
> that's not unique with a [function_name][ID] pair, where does the
> "behavior" part come in?

Maybe it is not clear from the patch above (and I can find a better way
to describe it), however if we take one example from patch 2 we have:

[...]
+ * read_mem behavior:
+ * 1. it checks if the requested physical memory range [ppos, ppos + count=
 - 1]
+ *    is valid;
+ * 2. for each page in the requested range, it checks if user space access=
 is
+ *    allowed;
[...]

So in the end a unique identifier is "[read_mem behavior] [1]" and if the s=
ame
IDx is used for both behavior and constraint there would be no issues since
the tuple is the actual unique identifier.
So for example in partch 2 we have:
[...]
+ * memory_open behavior:
+ * 1. This function retrieves the minor number associated with the input i=
node
+ *    and the memory device corresponding to such a minor number;
[...]
+ * memory_open constraints of use:
+ * 1. The input inode and filp are expected to be valid.
[...]

In this case while 1 is used as IDx for both the behavior and a
constraint of use
the is no ambiguity since the unique identifiers are "[memory_open behavior=
][1]"
and "[memory_open constraints of use][1]"

>
> What is now parsing these comments to ensure that they are unique, in
> correct order, and are used elsewhere?  What is the text for such a
> behavior and constraint?

Right now I have not implemented any check to make sure the identifiers (in
terms of tuples as explained above) are correct and unique, however maybe
a check can be added in kdoc_parser.py to make sure no duplicate tuples exi=
st
in the same file (I guess that we do not need to check tuples uniqueness ac=
ross
multiple files)

>
> Heck, what does a "constraint" mean?

A constraint to be met by the caller of the function (e.g. passing a
valid pointer
when the function is missing checks on the validity of it, invoking a funct=
ion
with a certain mutex locked, avoiding certain ranges of input parameters )

>
> > > And what defines an "id"?  I see in your example you use number.numbe=
r,
> > > but is that specified?
> >
> > I thought that there is no need to specify an ID format as long as the =
ID is
> > unique and referenced by the kunit tests testing the symbol.
> > Basically I thought that in some cases it is easier to enumerate 1, 2, =
3,
> > whereas in others a, b, c can be used or even a mix 1a, 1b, 2a, 2b etc.
> > So I wanted to leave such freedom to the programmer.
>
> Ok, so be aware that people will then put whatever they want in there,
> making it impossible for you to parse :(

Once we have a check on the uniqueness of the tuples within a single
file, we can add another check when building kunit tests that look-up
identifiers documented in the test headers to match the tuples from the
source code being tested.

So for example in patch 5 we have:
[...]
+/**
+ * read_mem_zero_count_test - Verify behavior when @count is 0
+ * @test: KUnit test context.
+ *
+ * Confirms that read_mem() correctly handles a zero-length read.
+ * Per POSIX semantics, this may either return 0 or return an error
+ * if parameter validation is performed.
+ *
+ * Expected test behavior:
+ *  - the input @buf user space buffer is not written;
+ *  - @ppos is not modified;
+ *  - 0 or -EFAULT is returned.
+ *
+ * Tested behavior:
+ * [read_mem.1]
+ */
[...]
This means that this test is testing "[read_mem behavior] [1]".
Having said that, technically this policy allows for very human unfriendly
itemized lists, but I hope developers' common sense and the maintainers'
judgement to be sufficient for this not to happen.

>
> > > And how is a id going to stay in sync across different files?  That
> > > feels impossible to maintain for any length of time, and puts a burde=
n
> > > on the developer who wishes to add/remove a test or "id", AND a
> > > maintainer who has to remember to go and look in multiple places for
> > > such an id sync up.
> >
> > Well given that the tested ids are defined by the tuples mentioned abov=
e,
> > the relation between a kunit test and the tested tuples should be not
> > ambiguous.
>
> How do I "know" that there is a test that matches the tuple at all?

As mentioned above the test cases descriptors define the tuples that
are tested. So using a tool like BASIL or StrictDoc it is possible to
generate a graph tracing tests to the corresponding tuples

> Your patch series proves this, it adds the tuple in one, and then the
> test in another.  If you add another patch that adds another comment,
> how do I as a maintainer know if this refers to an existing test, or a
> new one somewhere else?

I would say
- If the patch is modifying the text of an existing tuple the maintainer
would directly see it and, by using a traceability tool, he would know
the impacted tests
- if the patch is adding a new tuple by definition it is a new behavior
or constraints (so the gap will be identified by the lack of tests tracing
to it)
- if the patch adds a comment that is outside the list of tuples, such a
change must be reviewed by the maintainer to figure out if the comment
is appropriate as an informative note or if instead should be part of eithe=
r
lists (probably if there is also a code change it is more likely that the
behaviors and constraints of use must be updated)

>
> > Also I thought that, when writing a kunit test, the tester should know =
which
> > behavior is being tested and hence it should be easy to define the test=
ed
> > tuples in the kunit header.
> > So I do not see much of a burden, but maybe I am missing something here=
...
>
> if there is no automatic way of linking a comment to a test, the ids
> WILL get out of sync.  We have 20+ years of history for "simple" things
> like enums and strings getting out of sync in the same exact file.
> Whenever you are going to allow a free-form structure like this, and yet
> expect a maintainer and developer to always know how to keep it in sync,
> that's just an impossible task, please do not do that.

Got it, so I wonder if the extra checks I mentioned above WRT kdoc_parser.p=
y
and the kunit build process together with the traceability tool (BASIL
or StrictDoc or
others) would help to address this issue...

>
> And let's go back to the root issue, why have an id at all?  Who
> benefits from this?  Who requires it?  Who wants it?  Who will do the
> work to add/maintain/update them all?

Ok, here I assume that we agree on the value of having function specificati=
ons
and kunit tests.
So I guess that the key question is why adding traceability provides value.
To this point traceability makes it easier to understand the test cases aga=
inst
specifications, allows to spot specifications that are lacking tests and al=
lows
to easily spot tests that require modifications following a
specifications' update.

If you do not see value in traceability for /dev/mem I can drop patch 1 and
just re-submit using simple bullets and removing the tuples references from
the kunit tests, otherwise I could work on the implementation of the checke=
rs
mentioned above when building kernel-doc and kunits so that it would be
easier for a maintainer to manage such a traceability....

Thanks and regards
Gab

>
> thanks,
>
> greg k-h
>

On Thu, Feb 12, 2026 at 4:23=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Feb 12, 2026 at 03:00:01PM +0100, Gabriele Paoloni wrote:
> > On Thu, Feb 12, 2026 at 1:59=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Thu, Feb 12, 2026 at 01:49:18PM +0100, Gabriele Paoloni wrote:
> > > > Extend the longer description section of a function kernel-doc
> > > > header with an itemised list of function's behaviors and
> > > > constraints of use.
> > > > These are useful to link and trace test cases (e.g. KUnit) to
> > > > the different behavior IDs and define the constraints to be
> > > > met by the function's caller.
> > > >
> > > > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > > > ---
> > > >  Documentation/doc-guide/kernel-doc.rst | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation=
/doc-guide/kernel-doc.rst
> > > > index 8d2c09fb36e4..23e6c4b45b14 100644
> > > > --- a/Documentation/doc-guide/kernel-doc.rst
> > > > +++ b/Documentation/doc-guide/kernel-doc.rst
> > > > @@ -83,6 +83,25 @@ The general format of a function and function-li=
ke macro kernel-doc comment is::
> > > >     *
> > > >     * The longer description may have multiple paragraphs.
> > > >     *
> > > > +   * When specifying testable code behaviour the longer descriptio=
n must contain
> > > > +   * a paragraph formatted as follows:
> > > > +   *
> > > > +   * function_name behavior:
> > > > +   * [ID1] - [expected behavior]
> > > > +   *
> > > > +   * [ID2] - [expected behavior]
> > > > +   *
> > > > +   * [...]
> > > > +   *
> > > > +   * [IDn] - [expected behavior]
> > > > +   *
> > > > +   * function_name constraints of use:
> > > > +   * [ID1] - [constraint to be met by the caller]
> > > > +   *
> > > > +   * [ID2] - [constraint to be met by the caller]
> > > > +   *
> > > > +   * [IDn] - [constraint to be met by the caller]
> > >
> > > So the same "id" is used for a behavior, AND a constraint?
> >
> > The idea is to have a specific behaviour or constraint of use
> > identified by the tuple [function_name behavior][ID].
> > So I think we could have a problem for duplicated symbols (but
> > it is a sort of corner case...)
>
> I am trying to say that you have ID1 listed in two places above.  So
> that's not unique with a [function_name][ID] pair, where does the
> "behavior" part come in?
>
> What is now parsing these comments to ensure that they are unique, in
> correct order, and are used elsewhere?  What is the text for such a
> behavior and constraint?
>
> Heck, what does a "constraint" mean?
>
> > > And what defines an "id"?  I see in your example you use number.numbe=
r,
> > > but is that specified?
> >
> > I thought that there is no need to specify an ID format as long as the =
ID is
> > unique and referenced by the kunit tests testing the symbol.
> > Basically I thought that in some cases it is easier to enumerate 1, 2, =
3,
> > whereas in others a, b, c can be used or even a mix 1a, 1b, 2a, 2b etc.
> > So I wanted to leave such freedom to the programmer.
>
> Ok, so be aware that people will then put whatever they want in there,
> making it impossible for you to parse :(
>
> > > And how is a id going to stay in sync across different files?  That
> > > feels impossible to maintain for any length of time, and puts a burde=
n
> > > on the developer who wishes to add/remove a test or "id", AND a
> > > maintainer who has to remember to go and look in multiple places for
> > > such an id sync up.
> >
> > Well given that the tested ids are defined by the tuples mentioned abov=
e,
> > the relation between a kunit test and the tested tuples should be not
> > ambiguous.
>
> How do I "know" that there is a test that matches the tuple at all?
> Your patch series proves this, it adds the tuple in one, and then the
> test in another.  If you add another patch that adds another comment,
> how do I as a maintainer know if this refers to an existing test, or a
> new one somewhere else?
>
> > Also I thought that, when writing a kunit test, the tester should know =
which
> > behavior is being tested and hence it should be easy to define the test=
ed
> > tuples in the kunit header.
> > So I do not see much of a burden, but maybe I am missing something here=
...
>
> if there is no automatic way of linking a comment to a test, the ids
> WILL get out of sync.  We have 20+ years of history for "simple" things
> like enums and strings getting out of sync in the same exact file.
> Whenever you are going to allow a free-form structure like this, and yet
> expect a maintainer and developer to always know how to keep it in sync,
> that's just an impossible task, please do not do that.
>
> And let's go back to the root issue, why have an id at all?  Who
> benefits from this?  Who requires it?  Who wants it?  Who will do the
> work to add/maintain/update them all?
>
> thanks,
>
> greg k-h
>

