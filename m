Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119065;
	b=mEcT0y7yeREOzHG+q0stWekoV6Wra7O5ViulEm7rQLPQa/trt1t+lRwUmE2Gcz/QMPQe
	 gVAmf/Rtdyx81aOw1c8ocIHCflV0FU2IytmmNbAl8hs+2XjOjScBfEAPPN7gZJcFPYLph
	 iB8oCCgeUul/StMHB9ow+adZpFgzPHRWVOGdz4ZSph0yLZ5g1QFB7ajkgYbT6SCrTXXlb
	 U+dnjDtXEaiPYmtwlvV0r87oe84/3tPXC/OfiiNsajPSt68cnrbMugEs6Jqx3sXbzg3FI
	 nC5Livue9d2thmuK3ZIL5796d6BofsUeozVk8b3MejtjxqDED2ATkNPFRJIzD3ZSncA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=DZ6MRBphpDaEsaEkwyVS8b0WlKh787/wwfa+ssjtUBM=;
	b=qXN/FLihu1wW/aIzq55oBo7MB13Q9izpCu6uAyMVOsbySHXu/IfcKpjfYJ/km0OZuK80
	 k8WJGqd3/AwQ3S/4WQVdB9IPlsIUtk/nps6t4JhA2l3HXe466wgtFiXt+TI/UVD0CFrbw
	 nBYDTHOJg7CRo8CdVaibS7Wcw4WjJ1jH+xBODRFK8rfX+0QbMph05VHjohzYAAhVFNgkj
	 pwR1tMO3azV7uuLjSlJH5SLiizKm92hntm/lq+1c7lqlmmXnGdsBGKrhsjiB7bfVlewWr
	 UB4I/2ZYTREF08IiOpsNkwy7IIc5LcB1Q50Kkf7fhQK6+z2FF3EFaQn7+f8j0erLl+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=jp0oF4Ys;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D0A606A31F
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 16:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D0A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=jp0oF4Ys
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ccca948203aso71793a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 09:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793119065; x=1793723865; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DZ6MRBphpDaEsaEkwyVS8b0WlKh787/wwfa+ssjtUBM=;
        b=jp0oF4Ys897XRGpeW6RKR/fHWs0900z2eISbO0/7YoTTJ1fFarjXa0F+Tp0M1QIRaV
         1g8zSJLLa2lNBbVlsUVyLp3zNvrpzucfIl+D14Xq31PvhpEZ+hIqMTwTXDul/RmgikfL
         CjByDjQ1ylYmmxEchddCELFvL65xpS7fbntKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119065; x=1793723865;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZ6MRBphpDaEsaEkwyVS8b0WlKh787/wwfa+ssjtUBM=;
        b=b5BZKZwiWWlNvcnazRzR1gRiqESuyflRCGVlkWmqtqrJjkvRbtq0u48JdZy+iVP/Wy
         OUku9F0GV2L6bXYxRiMCQp2vlqEvLelHcTYXjpdT+7HNH1DbQZTm2/KLSUPcI6qs0jbA
         K2FSqFvS14H/d4j5y53c+v8HFJFRlfTXjrHjDKOf0UH7sFmIfz3ldQlwMIiSeGHkxXR7
         k4TvglqK30Xp5jKekMziN/CRoMpunPUqFLIlm/yPmqMeuYaNbbs/lmQIM5sr+4BmTzMX
         Byenyn2yNtm9jI7zVHesaQobZkQNwKmAJcMO2jc4b3lSi6ZAQH/SOUvimfaocDkHhL81
         nA/A==
X-Forwarded-Encrypted: i=1; AKwUvByjZM/Lc3d9hHiIKNNLNI8uJioaTpWwWqJ+HFGX61vJVRcbA5RAOrUj53+aimMi85yOHbjw00wwQ7fHdOZ0wrU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzwf5A2bxTcTKTQ0xxoMDTpAykrU2EOwmZTNmLCjuNp/fSVWtf
	mi92eR3fht9aiOyHdN+P7Jbc7LZxXghhweZ2zafOh5oXXt+VTPhSLFGeJTXV2CMFXyc=
X-Gm-Gg: AYBFou0rooxJHzhuYR7kWtEEf4SFwUxl5Jec4302cXVeqkxNjd0Jx2eHV9Op+MvW4q4
	XREQysx4cCWFQS4X+79xpZLyThyKO0HRP5bVFGZkDHJIh52jDvbDG7wAq7LF9kaZcSN2Z3xlO/s
	3cseWr6rHnneon3xeXw6GGii1m3nqy89afE2R47CD4Z7xpBhgqHfhtAN7oO50JoY2rTVM6uN0bQ
	54sSnWzY1z40m/nAiM4rJujbmZaEtp9Thgu8CyXrcj4aWpx2ANiNB5hcNcJEQ3fjuKBcRqtrDMA
	QJLo0awdB9NuLHO7rv5HwVgzvgKtdC/SB5g0PVkYB1IrVYDDkrNrs/2DGBPc/tyvwdcqRg44zrI
	rO4PDQVP5Dta46rdoLzdwqQSWARfI+8j13U6CdsYEfOppzcNqg2g4OiSAJvl8C+j/O18GyjBDR6
	oyJbksyZF+yzHggBBdeY9LWVuixRQp2BPC0toSIKJZ/yptUS4TGmXsbDNxP2ihUsLjlJTnW6L8D
	qA4WSgcyEO1022HRnxIYEU3XhL1lQ5WsdAlCf/crW+ms6s06d1+O5DYMjNuYmQnkfhT55MFdw15
	n3fAZ6pMoh0mq7SF4Ej3ncR68telgX9i6AN4yfTto9N7RI+JouCY7vshOFcyAadATkMoVhSJVsY
	4+mxrj7+bwW7mN8H6Th3n6OM=
X-Received: by 2002:a17:90b:4cc4:b0:3ac:b197:1a37 with SMTP id 98e67ed59e1d1-3ade9b2d399mr8594261a91.3.1793119064572;
        Tue, 27 Oct 2026 09:37:44 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4041fafcsm5635829a91.0.2026.10.27.09.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:37:43 -0700 (PDT)
Date: Wed, 28 Oct 2026 00:37:41 +0800
From: Chris Down <chris@chrisdown.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] mseal sysmap: Allow with CHECKPOINT_RESTORE, default
 off
Message-ID: <auDTVShTfZ2et9m4@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <7ff59c2ab6c234ca4d799f862eb7c3f22d671f99.1793094611.git.chris@chrisdown.name>
 <auC7SFhV_qj-agQp@gremlin>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auC7SFhV_qj-agQp@gremlin>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Ok, sounds good. I'll drop MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON, and fold dropping 
the !CHECKPOINT_RESTORE dependency into the boot parameter patch. Thanks!
