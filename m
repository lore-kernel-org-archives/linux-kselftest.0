Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9301AA7A6
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770904822; cv=pass; b=Ji6UTXbKcPYom/tgjGbBwqv+H68YlABSyPHFHAk+A5ceA+llIlTbDoBHY15+NHdqoymcDUH6rfplAbwETO794ESaf4REdBeG1fGrAxrYQgRxecF2ErZMfKTS01uX3U4Nbym6R4S6BRpSGIXYZ90BmirzCXRz7ba5TmXKPAfKQ78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770904822; c=relaxed/simple;
	bh=5So+AYlnYBUG8P833D7MIJ51WXhXlMTuvQnknuIF3Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U67iDh5N5JXicfRWgoNLTOevMxLg8+2Yx8r0CHjEECoTW3SwVs68W4hjs66HfoMyOe87Uut/pVFN8TxLyOpHTJSBoN95vr0NN9kpLq+6bEBfcFgpwvAKUgAWlnVLPO8W3XlFGJFVX+CfAavItKKMMj0Jxmj3Palsp20WCk9dfRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NmeI8/k7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NpWfa664; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NmeI8/k7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NpWfa664"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770904818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6fqDi3KyffDsVgAKVUvyPTS3GAkTlVPCfSZBYkz2v2U=;
	b=NmeI8/k7XNqOroOG/4q/Q7VQega1JnrNav7n7uvJaCV1nS08SFjR201HcCwBVzUyh0oFkX
	V7i/XI5CCQMF7ISFTvbtkophBQSr+7rd0dpemey+IXTMslG6GTLhLMPFASB+ojR/lX/r7P
	ie0aPsWkTNv3ZV3tfvuDKLAshdBMz3s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-Ifw8MM5BO2e1L69vl2V7EA-1; Thu, 12 Feb 2026 09:00:17 -0500
X-MC-Unique: Ifw8MM5BO2e1L69vl2V7EA-1
X-Mimecast-MFC-AGG-ID: Ifw8MM5BO2e1L69vl2V7EA_1770904817
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-502d38a3e39so40300111cf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 06:00:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770904817; cv=none;
        d=google.com; s=arc-20240605;
        b=b/p15eM19o00hwajlwC2rRg6BOXxmSyLRNtGqNPk9OImikzgubsdHhwslROkDuGUsr
         jNRgkDzbJaVlL4Uhd5fwSLYhV/G10hJnJLo4fnceiU12dJOru6AEqybuusEiB9mzoSy3
         G5S3nJsFuAURCf4vuFD7Nng0c9N556q95tt1Qp5jTDBnvcEBgQGy3UE7JBgOhiiHoGe3
         CB/rP3IwrkhO0u9He9eW7FPo8eV6UIXZD0hrQ0L5dBlt/cGB0K8WKTtyTc1IIVUMXxe6
         WUkxEL1zBbZUyc/8/yZgq8EAELqdYX9qkWNEO54UsQZk6W7sL/24zC5o2fAlpk09E5uY
         ltsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6fqDi3KyffDsVgAKVUvyPTS3GAkTlVPCfSZBYkz2v2U=;
        fh=9c7A+87D2Xp5bAMYfR7kIIXeaqgt8aRCid10mTSjvv8=;
        b=bjogKWCoMGuHJlbKPxDKzUAjOZWudLrl4UK7Mc6cIISn6aqDsZ77VGgHJZFTUV19Vu
         hscfNZMCEspcDZlqZAnF+n+KUcvS52wF5n89rY4JceEIGk9Lurqx8AwZsuiza0tVhSUf
         Df3l7yo2dTyKqhwyzzAp8Tpr2iAXHVADphNIuE9/s9gFR1ibdaHetzPl+k7Siyj+5nzg
         SVpLdldISciM/05I8qWacoGHklMrW1YubHmeLkJNq7BAjq3zxATISKHI8V8bR+M97bZw
         XygDAZ/eRYimGFEKA9FaXn+Xqf2pjdXN1Rr42gJSRalWZTQxkjQKFjCGel0iw/TVoRhr
         FNbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770904817; x=1771509617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fqDi3KyffDsVgAKVUvyPTS3GAkTlVPCfSZBYkz2v2U=;
        b=NpWfa664rfuTYRY3CUUMdlAIBgvAYmUB8imgTKx+wf9AUYiXd3s69vb1e3eYCcsf94
         preJ3qL46lbYHrKWDRloTzkaxBB6zWd76lWvfDdWKzuHW7WeacLUir+CHcpQO0/YKWDi
         HMpmABsbUQu0YfeZk1ytyqcdPpZCzycDPKeTAhIvSzE1YENj9IX9ntI40xApnYY6CyjA
         vZeaTesQKQK+x7QcS04kxjK+v/2Mz9CdiNhGZBknS4VUnV5YUjmWN/UTVTPBzqdBk44m
         aYvwmiAMNsLQadmlTz7GPoA6fBChhPMNOkPWTVoIzbvsYEyDwaOrlXJLQZErnmBXJ5T3
         d7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770904817; x=1771509617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6fqDi3KyffDsVgAKVUvyPTS3GAkTlVPCfSZBYkz2v2U=;
        b=okKFXCwYlqqcjyaYxqphcH5s67rv1m/gx64JkNl9Rs682fZdmRfirB765tow0BKQu7
         8HknUOaGwQmJgBNysMhzT4gLTj1/hkXiQM30aW9IZKqjQw+jRdGGwg+Q36Yb5JyZyx2Q
         3YRjCcVB2Tgskh3oqWlPUMotTfBI67uk3DwEFSwtzOMfnXVuakrsuigdvexUQUe5zqKe
         MF77908BIwPGH3z0rYSW1WDsGwMQ90PBucNizZdoZMMPPl44uLeDuNd5FxvnpwNypSY7
         WV1MO3NO6a0E0iyl63tugjGnd+bgMxVxKGjQp3Q0joMrD/v6nBiyO/rbxG0qJiF+1gas
         tY0A==
X-Forwarded-Encrypted: i=1; AJvYcCXRUsiv9yUexyOPrU4PyrQplCn//QghejEUAkrBoD7Irs4EFMdyQpGCr9aMt0/F2EzmASDuVdh9oxqJveAYyeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoNkB5VLE8NEToaoBDPVqG7RRFOVsmKbAL06j2LAZbJMtVcq4F
	0bKYbhFXRIhZUV6QnXXM2hP5GKrHoiYrbE1LdEs5AOlODQ1nm1nW2uTF7losd1bVj+GK+9agenG
	CJPiY9jnbXgKEUHDxz1ay5YvFGXDndH6LVCmqfcPcIXO+CVgcnecbkioxYvB+TH4C3tNkAgi3w9
	UxMV1xJuOJ5X0W5SxzR9QdTxCMCqrxDPgOwwCJGtcAw3D3
X-Gm-Gg: AZuq6aIYBZk5ThS5gfaMOZ+msfw2aCql18u5LWf2lUHcM81pv1Grg9PIm58V+8u4s37
	CE0irwz5nomQg3lwicb3MrCJ/R8T/Ac2KRC/4jJ4aM5WD+poaSzmrSIMoBMeq+0lMcFB6DNdPp/
	4aniR4xK/tHbIBRq1p0WJWWqG+xdAH4Mhajp9wZ06EuL8E83nt5G3i/Ah/zKZ+WSkUxpZm5SM70
	bKP96pfWjFZ6Az/MuOfXtcHLXXAvtRE9UQN+Ko=
X-Received: by 2002:a05:622a:4d2:b0:506:217e:b0e5 with SMTP id d75a77b69052e-5069471b3bdmr22134721cf.0.1770904815531;
        Thu, 12 Feb 2026 06:00:15 -0800 (PST)
X-Received: by 2002:a05:622a:4d2:b0:506:217e:b0e5 with SMTP id
 d75a77b69052e-5069471b3bdmr22132021cf.0.1770904813375; Thu, 12 Feb 2026
 06:00:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212124923.222484-1-gpaoloni@redhat.com> <20260212124923.222484-2-gpaoloni@redhat.com>
 <2026021221-grading-clatter-b7bf@gregkh>
In-Reply-To: <2026021221-grading-clatter-b7bf@gregkh>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Thu, 12 Feb 2026 15:00:01 +0100
X-Gm-Features: AZwV_QjUUvlcQ1gY_oM6dV3H03_w17i2jymN17xZ8bDIyjGg9gzhLqYbN4-NK1k
Message-ID: <CA+wEVJaFX4AE5ruKLvgYZhmNsOabovLp=2LAaLUYe5B9r51qEA@mail.gmail.com>
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

Hi Greg

thanks for the quick response

On Thu, Feb 12, 2026 at 1:59=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Feb 12, 2026 at 01:49:18PM +0100, Gabriele Paoloni wrote:
> > Extend the longer description section of a function kernel-doc
> > header with an itemised list of function's behaviors and
> > constraints of use.
> > These are useful to link and trace test cases (e.g. KUnit) to
> > the different behavior IDs and define the constraints to be
> > met by the function's caller.
> >
> > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > ---
> >  Documentation/doc-guide/kernel-doc.rst | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc=
-guide/kernel-doc.rst
> > index 8d2c09fb36e4..23e6c4b45b14 100644
> > --- a/Documentation/doc-guide/kernel-doc.rst
> > +++ b/Documentation/doc-guide/kernel-doc.rst
> > @@ -83,6 +83,25 @@ The general format of a function and function-like m=
acro kernel-doc comment is::
> >     *
> >     * The longer description may have multiple paragraphs.
> >     *
> > +   * When specifying testable code behaviour the longer description mu=
st contain
> > +   * a paragraph formatted as follows:
> > +   *
> > +   * function_name behavior:
> > +   * [ID1] - [expected behavior]
> > +   *
> > +   * [ID2] - [expected behavior]
> > +   *
> > +   * [...]
> > +   *
> > +   * [IDn] - [expected behavior]
> > +   *
> > +   * function_name constraints of use:
> > +   * [ID1] - [constraint to be met by the caller]
> > +   *
> > +   * [ID2] - [constraint to be met by the caller]
> > +   *
> > +   * [IDn] - [constraint to be met by the caller]
>
> So the same "id" is used for a behavior, AND a constraint?

The idea is to have a specific behaviour or constraint of use
identified by the tuple [function_name behavior][ID].
So I think we could have a problem for duplicated symbols (but
it is a sort of corner case...)

>
> And what defines an "id"?  I see in your example you use number.number,
> but is that specified?

I thought that there is no need to specify an ID format as long as the ID i=
s
unique and referenced by the kunit tests testing the symbol.
Basically I thought that in some cases it is easier to enumerate 1, 2, 3,
whereas in others a, b, c can be used or even a mix 1a, 1b, 2a, 2b etc.
So I wanted to leave such freedom to the programmer.

>
> And how is a id going to stay in sync across different files?  That
> feels impossible to maintain for any length of time, and puts a burden
> on the developer who wishes to add/remove a test or "id", AND a
> maintainer who has to remember to go and look in multiple places for
> such an id sync up.

Well given that the tested ids are defined by the tuples mentioned above,
the relation between a kunit test and the tested tuples should be not
ambiguous.
Also I thought that, when writing a kunit test, the tester should know whic=
h
behavior is being tested and hence it should be easy to define the tested
tuples in the kunit header.
So I do not see much of a burden, but maybe I am missing something here...

Gab

>
> That's just not going to work, sorry.
>
> greg k-h
>

