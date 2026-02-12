Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB531E868;
	Thu, 12 Feb 2026 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770909798; cv=none; b=cNurdr94iCit0A8xYbxx8NLof0Z4srVhWTeA6CDHYDgeEjT07NWcecmERi346/y6vCuS860E4EkV9K07x+gDQkE2du+zLjRyB/TALGnjbNj2RAmYleraFvjOZnxeSbLFQrv0jU37sE1VksAgqxI4EE+BYJmw99JtBEyPmxjUmsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770909798; c=relaxed/simple;
	bh=CXREZTqBenKo9jtPZTzM+VTNbxYZim0gWfWTgptwF30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/DZc+SwgthQKYIP020Zo3AqcdDbm5mGJa122q9Yi44evo3dUNPTxyiWDYF09kF9g8YOsTnfOzCK4rdWa6Kx0YDxG+ta9vNG0YIzOj0md58m9TV+Ad25bdu7zhpIZCRdu2SU/3oUsxNO7BozO2TEkxiRu+Bytm6UHPTP+QiAmfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wngCniLs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wngCniLs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFDAC4CEF7;
	Thu, 12 Feb 2026 15:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770909797;
	bh=CXREZTqBenKo9jtPZTzM+VTNbxYZim0gWfWTgptwF30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wngCniLsYobfy+cnJ0iQ8hJvHAE59mq29LzSxEBhVQD6cI6RhSToLCotLXlve5lyC
	 8O9Cv1a38Xqxsewi18XZ0aua6LyV4dre6Smx82wZWl8uDMPY+BtIhiLNMp0LTdQ+lo
	 QrW8b4Sy7tngQXd9V3e/ck2hvS4+DiaRwSdmf39A=
Date: Thu, 12 Feb 2026 16:23:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriele Paoloni <gpaoloni@redhat.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de,
	brendan.higgins@linux.dev, raemoar63@gmail.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	acarminati@nvidia.com, linux-mm@kvack.org,
	safety-architecture@lists.elisa.tech, kstewart@linuxfoundation.org,
	chuckwolber@gmail.com
Subject: Re: [RFC PATCH v3 1/6] Documentation: extend the 'Function
 documentation' with expected behavior and constraints of use
Message-ID: <2026021207-hatchery-spore-2800@gregkh>
References: <20260212124923.222484-1-gpaoloni@redhat.com>
 <20260212124923.222484-2-gpaoloni@redhat.com>
 <2026021221-grading-clatter-b7bf@gregkh>
 <CA+wEVJaFX4AE5ruKLvgYZhmNsOabovLp=2LAaLUYe5B9r51qEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+wEVJaFX4AE5ruKLvgYZhmNsOabovLp=2LAaLUYe5B9r51qEA@mail.gmail.com>

On Thu, Feb 12, 2026 at 03:00:01PM +0100, Gabriele Paoloni wrote:
> On Thu, Feb 12, 2026 at 1:59 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Feb 12, 2026 at 01:49:18PM +0100, Gabriele Paoloni wrote:
> > > Extend the longer description section of a function kernel-doc
> > > header with an itemised list of function's behaviors and
> > > constraints of use.
> > > These are useful to link and trace test cases (e.g. KUnit) to
> > > the different behavior IDs and define the constraints to be
> > > met by the function's caller.
> > >
> > > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > > ---
> > >  Documentation/doc-guide/kernel-doc.rst | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
> > > index 8d2c09fb36e4..23e6c4b45b14 100644
> > > --- a/Documentation/doc-guide/kernel-doc.rst
> > > +++ b/Documentation/doc-guide/kernel-doc.rst
> > > @@ -83,6 +83,25 @@ The general format of a function and function-like macro kernel-doc comment is::
> > >     *
> > >     * The longer description may have multiple paragraphs.
> > >     *
> > > +   * When specifying testable code behaviour the longer description must contain
> > > +   * a paragraph formatted as follows:
> > > +   *
> > > +   * function_name behavior:
> > > +   * [ID1] - [expected behavior]
> > > +   *
> > > +   * [ID2] - [expected behavior]
> > > +   *
> > > +   * [...]
> > > +   *
> > > +   * [IDn] - [expected behavior]
> > > +   *
> > > +   * function_name constraints of use:
> > > +   * [ID1] - [constraint to be met by the caller]
> > > +   *
> > > +   * [ID2] - [constraint to be met by the caller]
> > > +   *
> > > +   * [IDn] - [constraint to be met by the caller]
> >
> > So the same "id" is used for a behavior, AND a constraint?
> 
> The idea is to have a specific behaviour or constraint of use
> identified by the tuple [function_name behavior][ID].
> So I think we could have a problem for duplicated symbols (but
> it is a sort of corner case...)

I am trying to say that you have ID1 listed in two places above.  So
that's not unique with a [function_name][ID] pair, where does the
"behavior" part come in?

What is now parsing these comments to ensure that they are unique, in
correct order, and are used elsewhere?  What is the text for such a
behavior and constraint?

Heck, what does a "constraint" mean?

> > And what defines an "id"?  I see in your example you use number.number,
> > but is that specified?
> 
> I thought that there is no need to specify an ID format as long as the ID is
> unique and referenced by the kunit tests testing the symbol.
> Basically I thought that in some cases it is easier to enumerate 1, 2, 3,
> whereas in others a, b, c can be used or even a mix 1a, 1b, 2a, 2b etc.
> So I wanted to leave such freedom to the programmer.

Ok, so be aware that people will then put whatever they want in there,
making it impossible for you to parse :(

> > And how is a id going to stay in sync across different files?  That
> > feels impossible to maintain for any length of time, and puts a burden
> > on the developer who wishes to add/remove a test or "id", AND a
> > maintainer who has to remember to go and look in multiple places for
> > such an id sync up.
> 
> Well given that the tested ids are defined by the tuples mentioned above,
> the relation between a kunit test and the tested tuples should be not
> ambiguous.

How do I "know" that there is a test that matches the tuple at all?
Your patch series proves this, it adds the tuple in one, and then the
test in another.  If you add another patch that adds another comment,
how do I as a maintainer know if this refers to an existing test, or a
new one somewhere else?

> Also I thought that, when writing a kunit test, the tester should know which
> behavior is being tested and hence it should be easy to define the tested
> tuples in the kunit header.
> So I do not see much of a burden, but maybe I am missing something here...

if there is no automatic way of linking a comment to a test, the ids
WILL get out of sync.  We have 20+ years of history for "simple" things
like enums and strings getting out of sync in the same exact file.
Whenever you are going to allow a free-form structure like this, and yet
expect a maintainer and developer to always know how to keep it in sync,
that's just an impossible task, please do not do that.

And let's go back to the root issue, why have an id at all?  Who
benefits from this?  Who requires it?  Who wants it?  Who will do the
work to add/maintain/update them all?

thanks,

greg k-h
