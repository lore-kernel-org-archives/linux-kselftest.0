Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE95831327F
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 20:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407385; cv=none; b=lQW2c6lVESu522uiLDxIazkg7MtTVzaXU83LC7hcLDXy2ujphb2R/07qB1r+zErkDSo1SsqYaSbKZJFfuMSFtXIDMD0xkxe7Q3kjfzStpHmt7KW/mE+bhBJIKTnVWWOFzHWYr/H303ckOZA3a5fAmVVUkMZdr02POZZAtdVppTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407385; c=relaxed/simple;
	bh=UtQfTFcQQz26sVGJfaPAfwXb/6VrfQbxAomGRCM0hPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aitdU5jl+aMTOSUMbuQl3idfwdX4kt2dcS+U0kOGso6xBuwsYYJpUIe5kG8wV6UwmZ8Xi8ZqEsFd3e+/rfL6JF27xy24FQ+6YxnkkKAgPO60NvLr8mnANH0uQea/DwfZjvjZQgCn6vxDS465wFNEJb9jdjYvp9k1Z9JdrVhVC1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nJQX0VoM; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nJQX0VoM"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8318293f02bso112249b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 13:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777407383; x=1778012183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=98FH8HYWYd41s3fr9Etidq2Y/SsuKUn0hQ9/Ra3GrCM=;
        b=nJQX0VoMBrMX0i5dGbC54w4lFMRwuaJdkj5q3lPJOtatGQI0yBPmKemwyV2huZYodG
         i13sUkwdt1M1fVyOOBnVZ7DbmwLSqFPYNTb2R85jguYrw6a9QikVerNxsWYpmjz8gH4g
         uN+SHpSSvmb8b+AwEzqLnOyWLMeK1/sM6PrQaV1jXJcaYiHse4KmU0eKyIfiduqCiBnF
         thjOxr3exP6dsi8DBldD5UZXhxe1OUzdSWoxD4W2uOOgubXBN0gTAlzShg1FpG8ok2WY
         6ApX2N5KOqiXem8Hd2Q3Z8M4REY1OaVT9PvqVvHCEGDjofr/8RP9K2MiGNK/abpiVrOh
         bJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777407383; x=1778012183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98FH8HYWYd41s3fr9Etidq2Y/SsuKUn0hQ9/Ra3GrCM=;
        b=Ik3tj6nGqTXzlqU3F2YRuraUDhiVykA9So28GrKAXfc0CWgLVg9xnO0vrM5XVzMNf6
         iMLRzP5wDL7kR/TgYq4Q/PQPno6I67zmr+irv0VmHQkvH5uLUivholGTBDPL2az80U4D
         E9XSojOdBaBFsWDSjPDP5od8fGH36rjmj3T1GawCMga9g0ckdVKFu9KMueLGkxpNEsVH
         VVgHJfNcMCFFdwe87iujytnnJzwr8aavJJLpHPzdMOXUx3SEocMDM9KEv37qriD0FXNJ
         tk7dla03G8Il2w6pXt+Lk9CRr4kZe61MItFycKvzhin7r3yczZLRwwLT8RfaHUi5vWoj
         aukQ==
X-Forwarded-Encrypted: i=1; AFNElJ++2pO/m44UUFmIiJff+WWawnWq7xf0ZC8OhlVKr8FJKXoVd497AdYUWO5eKBU0vuG/a0wy6PphjmCx+CW/eho=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXl/82tVH5Dve4lDj/I2/+a0fXEHutOMP3oyQp4Fa7i/xHRrIl
	u9Le+Z+9uH5JiGdnMvPRecVVVvgqQTCixr4PSgu03Ng5LLloOPlamTBFPl+ld45ybg==
X-Gm-Gg: AeBDieumip9M3+9/WI35GfoAfU9KVfYoYXR94X/We1Eo5vO2T1x2/JONn+3Bl9QIO46
	Bi4YIqjvmtbgFYaGtJ1S2fdY40/V27Ouf1XxL/LV9pss+PSlaNq4Q+0LDANdGB+RZaySSdai+CY
	lPoau57HmIWSNfqL96OymT5JU+MZxg9E4d1j1o0YATV9a3aCqZ51ryEtCv+MQ5V9F3Jj9Rjpv5v
	YMB0HZ3T/HWkEQ5O23MWAE/fune+ywGcIKPv6caWlJuddizSUB0xnGnS/0DslXlaYfuZDmAb66w
	v12RDxwPBiu6aVQVca6DBG7drI7iXqzAqn/tOp+j4OLQA5TXXW+cM0+RvtMX/yjVk/23deAO4MN
	n58QUYZ5CReXkQongc4+3JT9oa/QH3LKT+rUUdMeSx8iO2IKddOC7YXTM2MVuyiCEkm6B+6Qtjz
	tzWUhSJCIRV5UZ93eYGVDtMWXCppURUpBhYLIJ9CCN8l7yY+n9cS+Fiwao7/Xz9w/hCfdIhELuH
	CprEIxtjJ+Q6c6q
X-Received: by 2002:a05:6a00:1404:b0:82f:47ec:944f with SMTP id d2e1a72fcca58-834ebb80fbemr309868b3a.16.1777407382525;
        Tue, 28 Apr 2026 13:16:22 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf6a1fesm3572011b3a.51.2026.04.28.13.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:16:21 -0700 (PDT)
Date: Tue, 28 Apr 2026 20:16:17 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	patches@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] vfio: selftests: Fix out-of-tree build with make O=
Message-ID: <afEVkVaIjNev8Ukq@google.com>
References: <0-v1-79f29139180b+8e-vfio_st_make_o_jgg@nvidia.com>
 <afD7-rg58XvqRJpD@google.com>
 <20260428190437.GE718365@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428190437.GE718365@nvidia.com>

On 2026-04-28 04:04 PM, Jason Gunthorpe wrote:
> On Tue, Apr 28, 2026 at 06:27:06PM +0000, David Matlack wrote:
> > On 2026-04-27 08:07 PM, Jason Gunthorpe wrote:
> > > The test programs are compiled via a static pattern rule that requires
> > > intermediate .o files:
> > > 
> > >   $(TEST_GEN_PROGS): %: %.o $(LIBVFIO_O)
> > > 
> > > After lib.mk prefixes TEST_GEN_PROGS with $(OUTPUT), this creates
> > > dependencies on .o files in the output directory (e.g.
> > > $(OUTPUT)/vfio_dma_mapping_test.o). However, there is no rule to compile
> > > these .o files from the source directory .c files when OUTPUT differs
> > > from the source directory.
> > > 
> > > Add an explicit chain of pattern rules:
> > >   $(OUTPUT)/% -> $(OUTPUT)/%.o -> %.c
> > > 
> > > Following the same pattern already used in libvfio.mk for the library
> > > objects.
> > > 
> > > Fixes: 19faf6fd969c ("vfio: selftests: Add a helper library for VFIO selftests")
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

With the fix applied from your reply,

Reviewed-by: David Matlack <dmatlack@google.com>

> > > ---
> > >  tools/testing/selftests/vfio/Makefile | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
> > > index 40165d087a0bc4..81c3be8298fdc2 100644
> > > --- a/tools/testing/selftests/vfio/Makefile
> > > +++ b/tools/testing/selftests/vfio/Makefile
> > > @@ -27,10 +27,13 @@ CFLAGS += $(EXTRA_CFLAGS)
> > >  
> > >  LDFLAGS += -pthread
> > >  
> > > -$(TEST_GEN_PROGS): %: %.o $(LIBVFIO_O)
> > > +$(TEST_GEN_PROGS): $(OUTPUT)/%: %(OUTPUT)/%.o $(LIBVFIO_O)
> > 
> > Changing this line (with the fix you replied with) is not actually
> > needed right? I tried the following without it and was able to build:
> > 
> >   $ make OUTPUT=/tmp -C tools/testing/selftests/vfio
> > 
> > $(TEST_GEN_PROGS) has already been prefixed with $(OUTPUT), so %
> > in the original pattern already included $(OUTPUT).
> > 
> > Is this for readability?
> 
> Yes, it makes more sense to explicitly match the stems through the
> flow than to have the implicit $(TEST_GEN_PROGS) == XXX/$(OUTPUT)

Sounds good.

> 
> > >  	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< $(LIBVFIO_O) $(LDLIBS) -o $@
> > >  
> > >  TEST_GEN_PROGS_O = $(patsubst %, %.o, $(TEST_GEN_PROGS))
> > > +$(TEST_GEN_PROGS_O): $(OUTPUT)/%.o: %.c
> > > +	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
> > 
> > Looking at this commit made me confused how this was even working before
> > and I learned that make has built-in rules to build .o files that
> > assumes the .c is in the same directory. 
> 
> Yes
> 
> > I see now that we were reying
> > on those built-in rules to build $(TEST_GEN_PROGS_O). It makes sense to
> > have an explicit rule to handle the directory mismatch between .c and
> > .o.
> 
> Hmm now that I think about it, I wonder if it used the right flags..

It looks like it used the same command that we will be using after this
patch, just with the wrong path to the .c file.

 $ make -p -f /dev/null
 ...
 COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
 ...
 OUTPUT_OPTION = -o $@
 ...
  %.o: %.c
  #  recipe to execute (built-in):
          $(COMPILE.c) $(OUTPUT_OPTION) $<
