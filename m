Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819220C038
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 03:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773372937; cv=none; b=D5ji4zqyRrNLF1TVfn081KcXOSCsZjWZf3Eu/Wx747jhdSkMKGamvJJiSNQKP2SastGFrVK6n6cS8hHzlI17C5ogEF0vvJvSczc2UxZCt22HjkbYyitUacG2TPR1Pe8EVLu17Z/iOE+5Fcp+0TUTkmXMnHWJjNCdhV+C8X/AX80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773372937; c=relaxed/simple;
	bh=aKY6aSiNpqxypTgxDFFgw7UHPZegC04bB/W/aZh8e2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVqWnMClmz0wdlSRr/0PlmyVQb1ioP9APgjRFGmslVJKLh0PqzMOkqxHh9s9jvCADpLX1SCQBwsYebFaKH+nO15JJSC6IJzykf98AoM9casBT0lpl88Rkhw3SWXgjlnChyFmnD9L7NJ9kLFr8YYasmi/tOiBQFQpwo+4goUh4xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QOyegFzS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rtyYpoVE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QOyegFzS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rtyYpoVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773372935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/8O0y76Sw4nNgrZ1YSQxVhOgzkbUj1DKbmac8/V7rFE=;
	b=QOyegFzSbGdIdohuOj9c9QGmdG8Znk9YMdegPYkbKYFjmaqHXe/kNxCoBqxZMo1XiA1S0h
	h/nyziLEUd/L9hGjn/G/iAS9/iIxs/TmrpIA1RUpTUTne2rDYwJLD2Y9VC4r/JtigvKyTJ
	c8xPcUYXDwIJucWcCCeL1o13huw47Cg=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-3UeUnsEgOSOZWvu87N6ZYQ-1; Thu, 12 Mar 2026 23:35:34 -0400
X-MC-Unique: 3UeUnsEgOSOZWvu87N6ZYQ-1
X-Mimecast-MFC-AGG-ID: 3UeUnsEgOSOZWvu87N6ZYQ_1773372933
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae53ec06b0so111393365ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 20:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773372933; x=1773977733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/8O0y76Sw4nNgrZ1YSQxVhOgzkbUj1DKbmac8/V7rFE=;
        b=rtyYpoVEUqF6jV6wcireTbijNUBdlNZWmytUwNe+/aC6ZpvO8fqRgpi16CR5W9oVd5
         6e49y1hDU3lBKBuaUTlL/WvuGO2FkJ+iCQJ7rPtgVJQq0D6sYKVwM36k0cJkAEU8E8Je
         9MIIinoUWRMqC65F4tYVAnPcznoJ44fEvJE++lYcI1bN+Nj+tLOg3DEFANK/fkqX+NSK
         X8OSKwBf6q045a38qsC2sNDt/oIIwukUI0F6M+ykpbSVdqQE76WNxjieyOxokgVS739i
         Wcw5dovfN7c34Ii664hwY7VVIR9h7i+wFqEpg4BtWJyMTLssFubEUD6d5VL663XmFL2j
         QLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773372933; x=1773977733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8O0y76Sw4nNgrZ1YSQxVhOgzkbUj1DKbmac8/V7rFE=;
        b=J5IrSduD30ZgGv14xxOfePndsGrT5XX/foPuJ/3l7T+mRDYwfAOgi8kJnaddNlbPGu
         mONvKFG68tvjfgAuznXdf3+tHVTYt3m2UpBFnLV7VDiB6ZTyLzG2beXojOX2t9DUiT+f
         LVD+KHs+vslaP+Ln3X5301GOIDsx5mhHu+m95IwkcgfSX9IYOOeffjtcp2rphKfFyKkT
         dx+0cuNNCWz0comMXCFSYJ2XX7fVt2ZUyhGm+5R6E+gjkaZRktd6l2TaXX1EPU2/Lf4x
         jUMkf46xvlQo6lWA+TERTEDJsBR7NXHSeU8xbw9bOu5HujiP52oosIThh4Ydpn+3iDvT
         oxWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVelic3k2J7iMhJDIkfsMIEJpfBV3leeNMxAahh96FBM8e2nCCRMCjwH0Eq9H8DJ5If7KlVnrqjYhdVpsij5yE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZoyodjoTBrqbOtgLFYT8vboaEQxUfU6rI3YvuieuNoCCEL+Ah
	PPIhubpWj93fFj6VTuIIZbKKmiQL8kWqAxr5zYzpRDmwYTl5ZmM8jXCHiNfjGWge34p27zVOBls
	Nd+fPEZVNaAKpwKKy4YE2zLostlj4ILxmyCXToRjM4XuDpI88DBWrLZ7OVaHy/yHpu7SC7Q==
X-Gm-Gg: ATEYQzzJLWMXGGMei5at4/k4ZEMP2r3tjU9WPBuH3yzwoMQJFFO0qg64aVcPhQ6wU70
	BYxhzgeULk3AAbTaoGiLdNtaZlfqzybe7D9voxsvyRkLRISO9bWnbAMv6F1b8U+X97AodHWCL8S
	Oc4y2wLLzN/Cj5+ri1V2QKefAiyeFQIkcQbKGGK7q+Qw0tkSqik9wZNJgDuQX7Ycm2Wnb29nwB/
	ZnYgI5p2RrEAkxwCckdsIrEqCNyiKksbhcL2rruAhKbLUimkchC80/50g5YbF0V6tEOAgJSUIfo
	TH0YHFBdk3CnWVaq8arhOleXKuzBwQhXI1JTV9nLv/bj3rQoGPq2PDaKD7haZUQI10ZJMV1/34i
	ESG6Gtw6lQqby0V0hPw==
X-Received: by 2002:a17:902:e748:b0:2ae:c916:511 with SMTP id d9443c01a7336-2aeca9e0988mr18292905ad.24.1773372932786;
        Thu, 12 Mar 2026 20:35:32 -0700 (PDT)
X-Received: by 2002:a17:902:e748:b0:2ae:c916:511 with SMTP id d9443c01a7336-2aeca9e0988mr18292665ad.24.1773372932438;
        Thu, 12 Mar 2026 20:35:32 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee5b1sm5475595ad.46.2026.03.12.20.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:35:30 -0700 (PDT)
Date: Fri, 13 Mar 2026 11:35:28 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, mkoutny@suse.com, yosryahmed@google.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
Message-ID: <abOGAHNnv9OZltdq@redhat.com>
References: <20260312040627.55257-1-liwang@redhat.com>
 <CAKEwX=MqyGQSMuVCSWmhKfHju5uHBe3ySQEgK9XuKwCvpL4x8w@mail.gmail.com>
 <CAO9r8zPmV8v0tiQvn2xFqX8F2oU23mfbVK67nxMO3QKt49kJeg@mail.gmail.com>
 <abNtUReAUHT6j9Rn@redhat.com>
 <CAO9r8zMh=tAV6UJcH3hhZWrZJO_emVe4raiq4wiBEgC-GAD2=Q@mail.gmail.com>
 <abODRsaeEul9Aj2X@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abODRsaeEul9Aj2X@redhat.com>

On Fri, Mar 13, 2026 at 11:23:50AM +0800, Li Wang wrote:
> On Thu, Mar 12, 2026 at 07:58:28PM -0700, Yosry Ahmed wrote:
> > > Yes, this looks more tidy than open it. I'll go this helper in v3.
> > >
> > > >
> > > > static void check_zswap_enabled(void)
> > > > {
> > > >        char value;
> > >
> > > read_text() requires string but not char.
> > 
> > I was just illustrating. This should be passed in as &value. That should work?
> 
> Yes, pass it as &value works well.

And use sizeof(&value) just get the pointer's size but not
the buffer size, so I would recommend: char value[2].

-- 
Regards,
Li Wang

