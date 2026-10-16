Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA62A4B515B
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158525; cv=none; b=dADbHicDuHiGllYU4O8to0AM960gOaaSeV6akZaHAEmVEM5vC+QKH+ZS7BtBC1WuI5uEblEmn6GkhT75z6Xyn0gVjWmvJB+NodyoOuYiMjAXLFCAtiQ/SeebginuoeNycDLJR2r1B4j+mV2FeSk3HjndGCddTXdcwY96z0DJSn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158525; c=relaxed/simple;
	bh=42BAW3sjeH2A6QDTyTHzsJuEqTfgp3lMvIVXW4J5Bxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEioJB8GZciCvKYp+JIytyUf6oKt6ERQjqELugwI7eRM+ylg8ktk2Ulg0qbWwKkFxJ0eEqv9hAYLOExNxCGN6c2BugpC8caf0FzvxcrbAMi5zoOwsQ+JBVtIChIkzRFtAbQHforrLUj8YbStv5JH1RnaXmsOBlogGQk/RA0MeVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mZcM2XEy; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mZcM2XEy"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91b89c6caffso20276d6.2
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 06:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792158523; x=1792763323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/H2zWOxTS0O6iCKkUCp+Yb9Q6oHYUrnCIj0DP3Fsx0=;
        b=mZcM2XEyMEqjHm/Hv6Sc3rx3CbgpiCQDPd81GjfsH/cYXmvEYGLPTWe6HCICjrOrpt
         8JHgONAVgrHop4cB2CEDIpmqgWZtM9V61TE8SiOff1cqiSvGyswYUbh1aU6HHHYWrsF8
         uSzFOhQVgxC8nTr87e+HwfBI02VUJmV0cOPi4a5Ge39B+XJOcE7alVcgl5vBEwdZMGo9
         xNM1Ym+vE4n2oFdyEXX9DBxwO447bT8Davx6NvkFtPw/vwCUwZ2qxiNlmQRQVOQqZ1ap
         ISl9cI5qOx2Fnw3QBhPGFJts9/obvS/zTtcnCJN8aXwwySu02c0XPSzDyvIbZvdFkmSs
         oSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158523; x=1792763323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/H2zWOxTS0O6iCKkUCp+Yb9Q6oHYUrnCIj0DP3Fsx0=;
        b=Cj4t70GiekfkSb5gmHwhBdrpCztY+Y/8s3PsqnMHPitF57LluOnJldWkj9Z7YcxfZe
         3BNRJCIl6JSTSD/zvjqCs6dCkrKzblBvEIOZbdZZO2BTt1LDu8R1aFoR6iLMlDllZWi8
         AJemnZVp68HRDXZncR7c5LmKNlvIjiN8fKMQ+ez0B+2NYnotvIGZWfr/IfXeqKoSvb++
         SlN2AXVqq5R4+BZ8UPKqX1ZHQZne7XOjqeIDxNYjAj2q2ytWUgJwvNyFzTpaebsAtTG/
         JABVZ/cAgfsX/4jCl9Sp19SMB5sGLIcHtIZbmYbf3mPPSS2auv0H7l9l8rm31hSl9bVi
         cP1A==
X-Gm-Message-State: AFq9FYLahJpSRTKCGuwrO87oC2rd8NZxLld/gqBBfjmMrVohob/qvatn
	qfZGguGjMcuP5cFO+gccFcZAXdrEn24QSvg27aQMnfsqtmR+ikVdUrIsqmOjXY8/1yQ=
X-Gm-Gg: AYBFou175bi9HBoGGbDkXnXAYIqXEsGKaYIAgROqQg0ppwSZU4DMzl3eMF6Tk8hQj7A
	ppGA4uVBcnJtLj0ZFnoyPiM439G4MmXJ9GQ/LP33VUve1C6wBiC1OmZF0KqKjdjGEhFFoK3R1Ug
	HhV2P4rgzlfdZ8C7/QS/EH9eJoUYQABEHnD5ULp9f4b3U9fMzBkujyjqv/gSGmBLSRwuX/6jFsy
	zHTD+9IumYPzKqx4Abu4ftM3N1pprE9q9+RVpygdKbByhfVs2C7HIx6FQyvYIX8BQOkDLKuE67L
	LgkJ//7XSaQURj11NyvHsdbHIqlB5kCXWWrs0LXaVusDDJXD9uhdC1eZvJPMMXqraFSzebb+0P1
	qxBaQzYtSDt+wgA4lymIarTgXE6rtmT8YdVQQgFMszVuTrAOui0a2HMZrRWEUmCnG4BAWvZDfpc
	l4rkQuOXDvrjhpe0AdOMg9OWBhhT+xlptrGgkhZ8eawSq7T1BX1z/LkDycMAmVrRJVjbHi02EtY
	7rgKJXtPiTuefgUToGkSWUwQVUECHomikAOzzrCfWmvvopM56I2BkM=
X-Received: by 2002:a05:6214:3013:b0:919:b4fb:eec with SMTP id 6a1803df08f44-91b5578517bmr396695716d6.36.1792158522383;
        Fri, 16 Oct 2026 06:48:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbaae645sm23369576d6.21.2026.10.16.06.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:48:41 -0700 (PDT)
Date: Fri, 16 Oct 2026 09:48:40 -0400
From: Gregory Price <gourry@gourry.net>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 7/8] selftests/mm: check MADV_PAGEOUT file permissions
Message-ID: <atImwW1ONQQ9Hv7p@gourry-fedora-PF4VCD3F>
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-8-gourry@gourry.net>
 <cba2a01d-630c-42d3-b6e4-b498f10c4b45@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cba2a01d-630c-42d3-b6e4-b498f10c4b45@arm.com>

On Fri, Oct 16, 2026 at 05:48:11PM +0530, Sarthak Sharma wrote:
> > +/*
> > + * The owner of a file may page out its clean page-cache pages. Run as an
> > + * unprivileged owner, so that capabilities cannot stand in for ownership.
> > + */
> > +TEST_F(madvise, pageout_evicts_owned_file_page)
> > +{
> > +   char *mapping, *control;
> > +
> > +   if (!geteuid() && !drop_privileges())
> > +      SKIP(return, "could not drop privileges");
> > +   pin_to_current_cpu(_metadata);
> 
> Is there a reason why we are pinning to the current CPU here and not in
> the next two tests?

Oversight on my part.  I added it where i got a failure, but didn't
carry it forward to the other tests.

> > +   ASSERT_EQ(mapping[0], 0);
> > +   ASSERT_EQ(mapping[page_size], 0);
> > +   mapping[0] = 1;
> 
> If both pages are on CPU 1's per CPU LRU batch here and then hte task
> migrates to CPU 2 here
> 
> > +
> > +   ASSERT_EQ(madvise(mapping, 2 * page_size, MADV_PAGEOUT), 0);
> 
> Then this can cause lru_add_drain() on CPU 2, and therefore both pages
> do not reach the main LRU list. Thus they won't be reclaimed and the
> test can skip here since the CoW page wasn't swapped.

I think there are other corner cases here as well. So yes i'll set up
thei pinning - probably worth it to just pin the entire suite of tests.

My original set had a bunch of this tested more explicitly, but this is
really implementation details that are not worth the additional test
complexity.  I think we can just rid ourselves of that and just pin
every test and make sure it does what we expect in that case.

> 
> > +   ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd,
> > +                mapping + page_size));
> > +   swapped = pagemap_is_swapped(self->pagemap_fd, mapping);
> > +   ASSERT_EQ(mapping[0], 1);
> > +   ASSERT_EQ(mapping[page_size], 0);
> > +   if (!swapped)
> > +      SKIP(return, "MADV_PAGEOUT did not swap the COW page");
> 
> Also, here we skip if we couldn't swap out the CoW page. Won't it make
> more sense to check with pageout_until_swapped() first if pages can be
> skipped, and then fail here if the CoW page wasn't skipped after all the
> retries, similar to how some other tests implement it?
> 

Ah yeah good catch.  I'll adjust like this:

   /* Ensure pageout-swap actually works first with a control page */
   control[0] = 1;
   if (!pageout_until_swapped(_metadata, control, page_size,
                              self->pagemap_fd))
      SKIP(return, "MADV_PAGEOUT did not swap the control page");

   /* Run the actual test */
   ASSERT_EQ(mapping[0], 0);  
   ASSERT_EQ(mapping[page_size], 0);
   mapping[0] = 1;

   ASSERT_TRUE(pageout_until_swapped(_metadata, mapping, 2 * page_size,
                                     self->pagemap_fd));
   ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd,
                                    mapping + page_size));
   ASSERT_EQ(mapping[0], 1);         
   ASSERT_EQ(mapping[page_size], 0);

~Gregory
