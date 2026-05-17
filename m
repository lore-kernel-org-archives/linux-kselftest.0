Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3798732ABCA
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 18:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043927; cv=none; b=AUbpMei7jOjz0WV05xISZAXQjeQNO37ACYAKg2l2V4fz200njaOeQQPX5biSuKbIbSKBjawcDFapiAnY0AEul9XiZpxDj1lmjDGeA8ZEY6mIC0C215aPSyZnmMf0VWU5t6rWh5eh8nPBHltl97fca5Hmjt6sQ8CMi+5SqKKoGbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043927; c=relaxed/simple;
	bh=dEI0dHO4/KkcUDU6wf5hMM3cRP/Uvov+/pcBQE3YBOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCw52rcPKbFX+2qBx5lahxw6gJdD/lSEAhMFetHE3eiNP6ozr2CrXV7NsWs0CLBNllZeiCNrW4J2bJOrRLqwTpegn1zAJnTwZBZ/fO37cwAT0hGZO1FWZ8Ln6jqBwUwfnyTmlufRRQ+Y+YhFTmkp94/db/YTsWxqN/PgAp1JHJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=SX7ltOKb; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="SX7ltOKb"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51306c9f2a8so20247451cf.1
        for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1779043925; x=1779648725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rMikKmjIRuhmCNsf7ga38/uSHQiRF0nG0AquMF025/Q=;
        b=SX7ltOKbDqicCJW23t8jAciw5Vsm4yNsVJ6Z+qUjPO9M9yPi6UtaAy86NR/Brh5Kme
         lYvZWWbknpMYomOS4ckwZTRq9ZCA6yJ5ls8Mef47zHwhtxCduJWd3xJD2qdUlhPqAN+u
         OI/Olu95iUM2KLqqlsQfXALMaNyPVxR+sjoJTa0p1NvXJG6YLvHVqFcSLNK/Ye0FOJag
         QKcXKJEXmUmLHlNYrPFYdek1VURSo5PIIRoa3cIPenGZaVxLmD4WGpHdZzvqBVWRLIJ3
         6JZNVyKXm7RvD1u3iA7zjFGniPOuzB8Vn8+LA6+m8FQPokL8h62a7zkvHCNtyIiUBe+s
         e5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779043925; x=1779648725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMikKmjIRuhmCNsf7ga38/uSHQiRF0nG0AquMF025/Q=;
        b=GTAKBwLcMytKHTmZVyKNmk+/+YuniCNXd+5QphxDOURyIMaLr7/5SuZl92pnNOzOj4
         PYKj+xWWLyl7US6LhItlocb6UOiZCYGApQ5nzZM2HaO/WXLJFNJOZZzuGbp9rYm04zO8
         ymU9NDwGhEOlIyfjG++1bLTqAE1Xm1w/PXnkChRfxt4ctgLSEQq8+IBemmA6iTVVWhHb
         9wDOWgeC1TpdVwsLOV6g6WIA5cKcRsqwsOFqlRnQRqYhdMb4a5jpbiy3L2vUdyyYkFql
         Bq9FcdWujSm5CJH9CDF7VvpqG73Cyg0tVv2lUAtbJ0ph997uGdJ6FiJPv+q9gFJSgfjR
         J4Kw==
X-Forwarded-Encrypted: i=1; AFNElJ/hWgU/sat4/S/si9Gai5riLME2I15oG6qTjBH25pduGs4sIWbP+olHFL5Syi9sZHvGP1fgC8cVjwgmxCmx6Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2r/mFziswK/6KobSb+K96Xibg9oznsxGUtgM3o7ws/PZsC9Ow
	exAbbJiuSS2r9uvrA+Y3qzh16mM4Qp6pr/O7OMWWg4zpEPEqbPvMK4Pe8rTx07luZuFTorpZmfp
	rSlj7MTc=
X-Gm-Gg: Acq92OHsWoGzE8qrZ7kIEwYhScUhOI4qKMydwXpfKdqsou9RcwWw5Q7H9RDHXnSZ9X6
	/G4BKnlpQ2ehaQ5mzUyOyQvNd25DW8qEvnrWve1vjl06kzW4Nf1T1rPwOo/0wq8kxnmivwtKe3X
	fqtXxSbEskiBI9FP5pY6uAsl4nm9Q2G/O3J4PWxt0CLRvXfJ6yZXTXscYmINq2EYgRlMP/bjidd
	8ehkOxjxAdOtFmIsYAQssxBMar4x6ssY7zDWf1vIrozwzp+8ev4KdLsPuP9SLlb1P+7/yYqZNHl
	FXQRJTF3P+1Lbt4i/vRPLcA49MzKXEI/8T6ZJmfkPDAhstfTfNutyhQAGQQswb96NJgLyC3QDLb
	mEf6an+XcuyRY9f6HMUks/j0vCyOV/jqlv3J6HIzB1KtQVBwQHX6jKaciJVO61teqo2uXwEYNfJ
	uOAwIr4BtSvKvtN5Kqw7y/ONby8fyfL+AnB3/LeZzOYx8OdHXiEZg=
X-Received: by 2002:a05:622a:6201:b0:50e:5819:d7e7 with SMTP id d75a77b69052e-51659ff8947mr173729421cf.3.1779043925075;
        Sun, 17 May 2026 11:52:05 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456888f6sm114656631cf.3.2026.05.17.11.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:52:03 -0700 (PDT)
Date: Sun, 17 May 2026 18:52:02 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v2 05/10] liveupdate: defer session block allocation and
 PA setting
Message-ID: <agoL1Afx2cHUNmE9@plex>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-6-pasha.tatashin@soleen.com>
 <agn7XnuO7VU4eK52@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agn7XnuO7VU4eK52@kernel.org>

On 05-17 20:31, Mike Rapoport wrote:
> On Thu, May 14, 2026 at 10:26:23PM +0000, Pasha Tatashin wrote:
> > Currently, luo_session_setup_outgoing() allocates the session block and
> > sets its physical address in the header immediately. With upcoming
> > dynamic block-based session management, this makes the first block
> > different from the rest. Move the allocation to where it is first needed.
> > 
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> 
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> > ---
> > @@ -77,15 +77,16 @@
> >  
> >  /**
> >   * struct luo_session_header - Header struct for managing LUO sessions.
> > - * @count:      The number of sessions currently tracked in the @list.
> > - * @list:       The head of the linked list of `struct luo_session` instances.
> > - * @rwsem:      A read-write semaphore providing synchronized access to the
> > - *              session list and other fields in this structure.
> > - * @header_ser: The header data of serialization array.
> > - * @ser:        The serialized session data (an array of
> > - *              `struct luo_session_ser`).
> > - * @active:     Set to true when first initialized. If previous kernel did not
> > - *              send session data, active stays false for incoming.
> > + * @count:       The number of sessions currently tracked in the @list.
> > + * @list:        The head of the linked list of `struct luo_session` instances.
> > + * @rwsem:       A read-write semaphore providing synchronized access to the
> > + *               session list and other fields in this structure.
> > + * @header_ser:  The header data of serialization array.
> > + * @ser:         The serialized session data (an array of
> > + *               `struct luo_session_ser`).
> > + * @sessions_pa: Points to the location of sessions_pa within struct luo_ser.
> > + * @active:      Set to true when first initialized. If previous kernel did not
> > + *               send session data, active stays false for incoming.
> 
> Hmm, why addition of a single field changed the entire block? :/

Yes, I had to decide whether to shorten the field name or change the 
entire block. I opted for the latter. :-)

> 
> >   */
> >  struct luo_session_header {
> >  	long count;
> 
> -- 
> Sincerely yours,
> Mike.
