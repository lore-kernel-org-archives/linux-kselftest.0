Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2BE3A48F7
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 06:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887040; cv=none; b=OtQG9rJdJjaxcTsidN0G7udY5/OXSkYLTNzzki1lsB34ZUJ7TrX4VeoQ1JXNZtsvueaK0ICiCldk7pXnbaCsbn5YRneisIwJqy9ZWFudz5QIT6he2XdOcCVXFlhEkJHuM4UW09vmSjqd01NAqJf24GRH+6yIhJde71wCxgL2+Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887040; c=relaxed/simple;
	bh=hP4nlPGIrqeNY9wpwr+srgGK8bvJUTL6djQnXyZwy5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOwaof1xwNA6IOEoc8JcIfHOTOULdUpd1dzKNSmMzxP5UgrMp57gddu6hhv+ilHT5Fglzn5dtM6iyJ1wnLcDd+QxPbseEEKGN2Yyi4tNIIVEs6jSKCm1N75fuFZE56C3jR1lk2uo27OQQyQZWwJRIyRsXhykXdc45mU83dPArgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XqUw/zD3; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XqUw/zD3"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8eff5ce3b95so3314266d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 23:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782887038; x=1783491838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5xWJ7lGSS4cy1ExwRI73Ip42ktEi6AnmleUk+CzcRsY=;
        b=XqUw/zD3iq+eGg0QalMkPbgj1OT8YwYSgzm4d+KIM/UXNeWVBlWIgHyp6WSh9pvADJ
         7NoipYiINTQR1vT2gpfcrH7hGdNXntTMmhUvLl+UjIFF9d+yPNdJ/KuWBwSNJGL+5vjM
         NfCow4Egn9Ekz4VUpS4Lu4oA6JUBLm986MYCSuro5QTOb0SlS/Pj4/mXXFwwTNFbjqjX
         k6IRHz/nggG36ohWpJQb46AWsx4B4ZsLUZojLu9tt3LqMj3Cmx4+FznBsGkomigX48ky
         HJI38PZ10RB9oNDzy4xt9Wh2JwYYcg7FloV2seOTuDbGiUrdqZyXn8PZzJ00N+NL8CM5
         f9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782887038; x=1783491838;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xWJ7lGSS4cy1ExwRI73Ip42ktEi6AnmleUk+CzcRsY=;
        b=Ur19waUCJYfA6f9J96u8ZWP+3vN0gqpp6EM+2JMuAw+99PS54pH9Z4jU0azb/WT0FD
         Romko+IcGDhmsI9RnVd8O8R3P5YqsLZumchllK4nm+Et7TQ4h5w2Orm+vgLGxLaa0mbx
         2kMeLBoX1L/sy+FPZWOvF9w9AuEP2CHbp4xrUvOlu+tCQuXR1MvkzMSuenG3Qgygfeav
         qJMwv9gcExVYJI5vzLXxfnR1/oBdXSbh9y36zA1pFwEcwTuoKdNQz+lK7ecxm3Io1LU+
         gBotCirU0V4Y4O4uoI6P/JOYipxkHuueEbK9+H/lj+0MXVK964g0Sbhsk1xvMJr2EKez
         +1Ug==
X-Forwarded-Encrypted: i=1; AHgh+Rpog4wJvFsBE3ZfI90sNA1k6u3GPb+V7awFrLwJ3yuVsI+HHxW3nqz+3ClwL4LQFKL+i1B64TuXrwomLQMREi0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2/tF14fvkrGhlcv1Rmw6k97DDI0j4CDEusmGXKeowkhjIcj0o
	7RcvpVxbH0HaYYashKVNvabZ/f005x4G7rBLiqQnGAP9d2jgmNCAzyh9wqmQo9mhShk=
X-Gm-Gg: AfdE7clxb8lLzHsoeFiJiboniGnrufwT11CEfbQjPY1ae20Ngz2jqGqIqyb8u4tTuvY
	vLwXlH1EWc0dgOU+5OJ4DhGKAZYBkkwsN4xwLIuiVHIW78vk65IiKhzmcXanHYrGD738EOlnTrH
	FfcJ3TxnVc7iQKHNosTI02IDSmMu+jt223jG/jVeG5P9LB/6C0ilzhblmOrvqPNUpuK5CZwhsql
	CM+xbDteQ7RfNAiag6E16f1pMVrvSMXIL9j+2fy8vdF2daTibWZthk0TwdIa84MTpkimNUUFK4+
	MS/bPxyXlrDu0RL/ltBruii2JiKau55yghzWA2yBFRORJOE7NvwRiG48vikVS74r11DI5tVSpPm
	c3XeKBXhFbftkohhmUkEjpisr1Fh4HB2dRnppeI0ft1SiLoE8LrKcbQ/Bk6RttC/4ues2q+s4G6
	jyHySjyv+Ze8eE4AXr31UL10bXFzV0nSubpRp9hDKKSe0wvQutFgWr4k9mb7J+TiEYrbxe
X-Received: by 2002:a05:6214:2dca:b0:8e4:d2ba:d677 with SMTP id 6a1803df08f44-8f3c7e708demr3649096d6.29.1782887037749;
        Tue, 30 Jun 2026 23:23:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f361ba3efdsm12323456d6.39.2026.06.30.23.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 23:23:57 -0700 (PDT)
Date: Wed, 1 Jul 2026 02:23:52 -0400
From: Gregory Price <gourry@gourry.net>
To: Hannes Reinecke <hare@suse.de>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com
Subject: Re: [PATCH v6 09/10] dax/kmem: add sysfs interface for atomic
 whole-device hotplug
Message-ID: <akSyeHnfcDmxnCSz@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-10-gourry@gourry.net>
 <akQ_xlJtXNgnGUdf@gourry-fedora-PF4VCD3F>
 <abde41f0-7d40-42ba-a232-cc0538cd0e4b@suse.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abde41f0-7d40-42ba-a232-cc0538cd0e4b@suse.de>

On Wed, Jul 01, 2026 at 08:13:28AM +0200, Hannes Reinecke wrote:
> On 7/1/26 12:14 AM, Gregory Price wrote:
> > On Tue, Jun 30, 2026 at 05:18:41PM -0400, Gregory Price wrote:
> > > There is no atomic mechanism to offline and remove an entire
> > > multi-block DAX kmem device.  This is presently done in two steps:
> > 
> > ... snip snip snip ...
> > 
> > Sashiko pointed out a false-positive, but adding a fixup patch
> > here that adds additional consistency.
> > 
> > On total failure - release all resources.  This makes the sysfs
> > interface consistent with the probe failure path.
> > 
> 
> Speaking of which ...
> With this patch we now have _two_ interfaces to do the same thing.
> And both will be generating uevents.
> Which is far from ideal (one could easily envision _conflicting_
> udev rules, one set doing an 'online' on the old interface,
> and another set doing an 'offline' on the new interface...)
> Is there a way to not sending uevents for the old interface
> or to make it configurable?

We do not allow "offline" in the new interface.

That fixes the entire issue - the blocks are gone, nothing to poke.

~Gregory
