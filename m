Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622FD30FC1E
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953069; cv=none; b=lwbSJgmnPmAm/Z3CbAL6E5TpQqCWouXCuhIeW1iSizPwbuXEvcRejYDUVO20jNttFgQm/noToJ09HH38Jdf+qa4yNIRKcoyVXKnRoGYa1shta/upFT4KeDTC6s8s2XPOyVCgyHI7/DgVOZWOOLVj9GZUfUTILBeXijD2mYLjcoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953069; c=relaxed/simple;
	bh=93DgQkvyCBKcB5iVjkvu47HUGp7BR5xEpAEy3kzg4Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r1w646p/cns/7f9NU6XO7JJQKyfyzyqNC5j9Bc1HU83aFCKED06qmXtgzbxrzipgzKC2Vw2j1yw/ltdOrAoFzQYeCmXtgQDEvQuUxIGZw1j3R1yug7fC2tVxYnyTyE+hashRAjbh8Mu+8mhWoLJXBBIHPPjI7TslZY9CujFvc4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlPAneEp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlPAneEp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4890098abbaso49752765e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 07:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776953067; x=1777557867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KWq8azbCSD7brpyXZ6QpBU16YtUoefjhmh1Zjdknw8=;
        b=PlPAneEptNA1rVpN8Yvj8bpDR7v6+MuTpAfa/OT0mOajhvvKu5lDO+DQqffF0qqOl8
         65g55upfK54hjoS3NTPo8GEDHpdUU1CbOmg6cnxBHDelLJe/TftwO61k+qIfOaHYXwlC
         QqHV/Yumrp+t8QAGS3hrH/3TUFAiuE3j3xtrVx0JnVYzyfkJWxdFFmpH9ddhFb65CLVc
         GqiLSzr7taNsZ0i1IBW30JvmXvv4OttEzFqNavQG4i9KcEjgcFY5wJhF/AZhLNzp1KIL
         /2lPJfPMYjQJn85zvIcCq8lfe9TCYP5PriRZjWZ57vJU8aUntjNc8BVhSPUh2rgIKxN6
         DyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953067; x=1777557867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3KWq8azbCSD7brpyXZ6QpBU16YtUoefjhmh1Zjdknw8=;
        b=M2trky7SeMcIRHk/HrKYJkB0hnaXq1wMk/v5fwjnQpEqe1xL0y1afbGK5YJDkzrGFQ
         ZzRB6gSerVON3RQ1YeF2iU7UnIB3QDXHYjRMo0gInseQ58FaeIiyFAJkhQix6BlXHF0i
         7wMhbkeKgrCSwGL0xWugYvWiFKYrG0X7T4T8/0s5uuKnspAC9GlSdP/oIC+6GMypnzXG
         Yocc0gaTV1BFkTWLoRt6BdTkoc4NP+xmex/8jbeeN768cF9CsQbPz+ck37anElnRlMUN
         zpkktUX0Q75I7sw741X7dCFaJP7Sh0Orw4PhqfE4OGecTcCMogAsQjXBlePApzvqc3u0
         QwOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vndXBRvW/LV1vulzj+g+Vl7DGw5CSp6Jx7TiFPan4P5T2//oCMa5/fDSFytwFrfBx+Z/Jc0BJKS4jxA1vttM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIwGjzBSNmhG69Ehau+5QVXP7UFk1PLeVg0QegHVIS/FbMzl2o
	NcBf7hsF+Szr+D8BtjvAl3W1uG2SzJcPkY2X0Ppxh0eja0rxRRVjSPOh
X-Gm-Gg: AeBDievzVQhvwHPPoegp07gWpraAX/sOv0tnYCGwbNHcWtNbvVct4zPHF7uo2O7emas
	n2d299sYg1roKL2Tw3d+fMYkS8awh5m+yqiXR20suyNzRPLAwMiDv39owMQmRPe2CT8GScFc4rL
	GsFYGyGMgwseEoRhbtcunXIf8z1KhOp556yvS94LNrTZjpDGcEiUtr8snwD/P+kvXwwGEKidFwi
	wQatm7jqmvg/GMXrU+AVWkQcIU9YFoJZkelgr+Up91Daw+X9elDy/qGdpleH+dQQzMjrOyXHi/S
	PgpV5lZyl1UqS/vJX80Ge3FFXQ/URuCYgEV9ZaxXUKzqtXGKlN0ewqAhY/9OQNh4nI/K9U7FCZ/
	YzQ3Ng+Nz5EaJ6CZqXJ45i++RFkO03ll+AtP8lpu+64dobdE5DxjbiONrcJm6X78j+hbRyOyHFq
	8fuZS+Y0Cq/SEtz9fOvfBOtXKm9FDLNQ5jQk9gfKU+T02+IxUEzIEjgeTtQopDxRPg6t9OSoHQo
	Q8=
X-Received: by 2002:a05:6000:4283:b0:43d:7ea1:fb53 with SMTP id ffacd0b85a97d-43fe3e15f7emr42641829f8f.33.1776953066423;
        Thu, 23 Apr 2026 07:04:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4dc24cfsm52984876f8f.16.2026.04.23.07.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:04:25 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:04:23 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, Alban Crequy
 <alban.crequy@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Brauner <brauner@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Alban Crequy
 <albancrequy@microsoft.com>, Peter Xu <peterx@redhat.com>, Willy Tarreau
 <w@1wt.eu>, linux-kselftest@vger.kernel.org, shuah@kernel.org
Subject: Re: [PATCH v2 1/2] mm/process_vm_access: pidfd and nowait support
 for process_vm_readv/writev
Message-ID: <20260423150423.1a428820@pumpkin>
In-Reply-To: <62d88cde-efc0-48cb-be8d-813eda810343@kernel.org>
References: <20260409142256.131676-1-usama.arif@linux.dev>
	<62d88cde-efc0-48cb-be8d-813eda810343@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Apr 2026 14:52:26 +0200
"David Hildenbrand (Arm)" <david@kernel.org> wrote:

> >>  
> >>  	/* Get process information */
> >> -	task = find_get_task_by_vpid(pid);
> >> +	if (flags & PROCESS_VM_PIDFD)
> >> +		task = pidfd_get_task(pid, &f_flags);
> >> +	else
> >> +		task = find_get_task_by_vpid(pid);
> >> +
> >>  	if (!task) {
> >>  		rc = -ESRCH;
> >>  		goto free_proc_pages;  
> > 
> > pidfd_get_task() returns ERR_PTR() on failure (e.g. ERR_PTR(-EBADF)),
> > but the code checks "if (!task)" which only catches NULL. An invalid
> > pidfd will cause mm_access() and put_task_struct() to dereference an
> > error pointer, crashing the kernel.  
> 
> Yes. Should we add proper selftests that exercise these code paths?
> 

Probably worth checking what happens when a 64bit process tries to
read high addresses of a 32bit process.

I remember trying to grok the way this code accessed the iov[] and
failing to find the appropriate access_ok() for the accesses to the
target process.

	David
