Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE73E364051
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 02:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529074; cv=none; b=j8+ovcPDK5SyW4VngF1KESmdBOLNB9EDA/5E5bUBi7+BbPmFUCs3FuBkWViU/i5EJF9JL20y+f5QmKIgyV0J3MssZFTbnb+HzMQ8nStnqi8Bg3SGdiQnV6W4DOp6Q+/19N0yo6c+1lNSlxhg/wW6L0sOjfC8xwklGgM1wDI3rF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529074; c=relaxed/simple;
	bh=AS7Co8RyS/RWpa1/YRQO4aU8nxHDrQCiF5/Dyfytx/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uk2vsJbspmIhVF4FV6HJ8fJZF3n9fI9cDLrNyKnGhOJd23dZSVxi4z0nBT83klzu0EWz0dopObAoua0imDXG1828zpBlhIIFpWXr4WG+foBM8RBfVIa3smOPlO6mb5jY3M9kyELht+zbMGwNc754cOu0Oxl6Th5Gh/WDVG0Rcys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZYGtkOq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZS1FUI2o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZYGtkOq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZS1FUI2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775529071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+relXseHSDiLD/cBAI0rxB8yeQocHqRAcYJEZB5dGtk=;
	b=aZYGtkOqx6MU2mPyIh8tcbZNM/Cnp2snKAi+6uosFgoFvBl+ccxbKJ/AvqS6RclkU30yMb
	2MlD29dnNE6CSy++gkFqwW7mIii0hyk7p1DtTlgEnhG7ZYo2rn0SviLXxOd9ghZbnAoK2w
	kS2Rhe6TftZus+moGZEE2nsZFETMcg0=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-Ay-MxbtsPv-5uEXO5IdvHQ-1; Mon, 06 Apr 2026 22:31:10 -0400
X-MC-Unique: Ay-MxbtsPv-5uEXO5IdvHQ-1
X-Mimecast-MFC-AGG-ID: Ay-MxbtsPv-5uEXO5IdvHQ_1775529069
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62da7602a0so2603764a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 19:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775529069; x=1776133869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+relXseHSDiLD/cBAI0rxB8yeQocHqRAcYJEZB5dGtk=;
        b=ZS1FUI2o3t4uj08yvHjHVvugjxTc9AuFVUP6a8diSr6Ptt8JoqWJsu+QoppKTPBRgW
         6GbkwYx2OH+limmPvpEi9SDZDLA1mXtogWDeyhI7aLf65bbEXKyCSV8ViPq4lJ0TG/tW
         EC+C/Pj/cB+KStF0M4iBIAY0MZzB3mhBJarDimjLYiboke9Aud3JnXNLedbz78e30xNr
         dU/tjMRKp0U8Km8Hqi34rsfFvokH6WL4TiE0wqN8yNRFTIhJC9gWSFGuBXCtuShxYdAh
         SqaMbbinRIHXE77zm4htoNdWXSJ0jNYcdC4X849hKySnSpn1gkENhpsuYcvk6QFFMU5T
         AZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775529069; x=1776133869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+relXseHSDiLD/cBAI0rxB8yeQocHqRAcYJEZB5dGtk=;
        b=mAxvZxs+lUuJACp7GukiY3AG6sJdERJL2hfug8NBbUX6SKus6rXzQ0O+y8PL+avMZ7
         I0XXivQLKn0kkzoYLuc9fOQw1fcNpbeuQL78RhfygcBX+eF7t65+OdUq21q7Yr69c5yO
         viR6V7YbES7lnmZ9UFyVSVLRq0IdX5XO5QVbxy+IoqAega20P5U85/mE2OFnb1xQorjI
         j6Gyc2kIDASv6AJL9IOeMfjEdjIvmre9agdLqFRp7qNBYk8hWJcYIY4VVlQmEDPH+h/K
         cfZWORV26hlhYQTA62pBHpOr4bnn5fZatQ0lLseaDO5e2me1ejHUxzIi347LsEJH9VOP
         vwYg==
X-Forwarded-Encrypted: i=1; AJvYcCWN2oTHhGPgU9a97/aSOovwgsciqk3tqqWl7m4+9QF3oHWpmB+l+6wn3+UTyU4kAEvdQwBfJ2e+qZWq62IY3Vw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws5Cd3DqcnGPW2JNaSRmegY83FB/abjRUK8vCR5nVrrOgFDBEX
	coCrb0Zri4wtbSZ9fNiYq2T+eHLVSWzc7XocTDxILimPXak24JzqGhYvzzWpl8m22BiPFvN6m09
	8w6dR/7uSXPMFMUHaqjTVgZ481DKcRCiLSYdw/bh8kS4R71Saty4qo+fOuMVwHQO156yGcA==
X-Gm-Gg: AeBDiev/+dBLZI2O7A9QIoUXiKL0YacPuZv4qvwgRixONGJ8CDWd/CSQpDEqZQD7GXi
	paWC0cgShNiDYPtAISNFXF2+llarlUseiIgvF0Lq2WP4HBMPlUdNSDwm3b2moMv5hbO3+LLglb3
	qj9seVnROwwL0P80KLZBsbTiELGZVWyp8z+3ueMQFeyYaB2EHzyc//26ZYwXDiLWluPEW3GFXMJ
	0/u1qXWjAhVOPzPepFQYYrIzlQFdEEYjBLIgYFJodJFn+0CaITzwqFVGBZaylIzd5r9ouCvZSfC
	ZnA55Ya9UiozVAAd07cuCs8HRr+XgCSQA282wAgthCWcAFFp0agdKz5cooaJieKtpRjkT/dbqhc
	/dbj8RVSSonkK0bWU7g==
X-Received: by 2002:a05:6a00:3e19:b0:82c:d6d3:31a1 with SMTP id d2e1a72fcca58-82d0db4f938mr14513061b3a.29.1775529069381;
        Mon, 06 Apr 2026 19:31:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e19:b0:82c:d6d3:31a1 with SMTP id d2e1a72fcca58-82d0db4f938mr14513020b3a.29.1775529068879;
        Mon, 06 Apr 2026 19:31:08 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c72967sm15221583b3a.49.2026.04.06.19.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 19:31:08 -0700 (PDT)
Date: Tue, 7 Apr 2026 10:31:05 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, nsc@kernel.org, david@kernel.org,
	ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] selftests/mm: clean up build output and verbosity
Message-ID: <adRsadO77aF3WcWm@redhat.com>
References: <20260331094402.144131-1-liwang@redhat.com>
 <20260406193216.GA1319599@ax162>
 <20260406125133.eeb8efed993ae1faa2a9ad73@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406125133.eeb8efed993ae1faa2a9ad73@linux-foundation.org>

On Mon, Apr 06, 2026 at 12:51:33PM -0700, Andrew Morton wrote:
> On Mon, 6 Apr 2026 12:32:16 -0700 Nathan Chancellor <nathan@kernel.org> wrote:
> 
> > > Second, the specific 32-bit and 64-bit compilation targets ignore the
> > > standard kbuild verbosity settings, always printing their full compiler
> > > commands even during a default quiet build.
> > > 
> > > Notes:
> > >   Andrew mentioned he hopes this patch merge into kbuild tree, so I resend
> > >   to linux-kbuild@vger.kernel.org.
> > 
> > Kbuild does not maintain anything in tools/, so this should go through
> > either the mm tree or the kselftests tree.
> 
> No probs.  Li, please send it along after -rc1?

Sure thing!

-- 
Regards,
Li Wang

