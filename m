Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219826;
	b=hlOwetxqH3a0W/xQrTycAM/Puk1Eybzf6hCFkimTTiXU0IfuUYPZWsWHx+jgTTDwoSJT
	 mJQZE6Hj3q0DgIZ+j/fRoHbuYJVFVmyWjBlOTaSRgXJHv07MY4JgWhmuhf7Swy/4V1Erp
	 BAoqj7pC6c3afyzq950O9/O6gV3Lwi7rIoMLbzSaczSKrzwAuOJzkThuYqXPGh+oguEB2
	 3T8Im2d4mEzN6LgBeHL2GDsMYvTm2peFOez30n5dxUhEIwaXr7EmLw+/OC6h2WYjfWNnM
	 Xl8+0b1LD/DJyRQCmx/lP+cbt/2LlHnLv4oc00dMdgLJU/goOAghgcXj0X+myPCJOfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pXX75GaXTMr1qGEscquEidPOCC4V+kXbyCqTlbWwNJM=;
	b=XTbklVoFXdBZwxK601khWcO//c1TToj5+I/l8n1rky8EyxhFPHjnRpUfj2anxOFvf1kC
	 Tu87+85Vkyklz65i47533gulztOlOIDJUx8Ej2aWmcqX2XpgVFK9s8FCI046JlpzAvDi8
	 J/9sIBksS98nb/bkDXOCKhhNDF3VqaZM4QXQCl/Abmh8YRiSKDcAZr0LxsFtUAE/ekjCV
	 +LNgV5vqdb92J9yIrx+QhCpYBxewfmJX0ljb+ZSyVzCqmfOYPbmDUiRZe/3Zve0su7RqL
	 fefgh/18RPPAHKCkCawxfQJs1R5eZJgjTu9OF4JbbnrVD0xYWyRUUIxLyLnB/aPzqRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=EOo6CdTD;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435C2606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 435C2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=EOo6CdTD
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso482519e0c.3
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 13:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793219825; x=1793824625; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pXX75GaXTMr1qGEscquEidPOCC4V+kXbyCqTlbWwNJM=;
        b=EOo6CdTDNZUpChXfxEDljEqH4BHQcYLAieNp0ah7yEn4oUXvcC24nmaVAiwb82JiBm
         MS9p7RNsQ/Yau2L+HiebwbdNeFGcSeWtjxQSQrKEXXUZLzQBLrwrBmZ7gkprByDUrwDA
         O5lORsL1LBmM5aKlh9Z1Tz9yxOe2n0MJn4bLykArrCCNf+7Ld5UgrypzciYkhPU4TMxJ
         Vfyu20n7gPm+7yUfNBQAdv/Kp20TS4URauCeEtO9122o3RK1V/Q4WQIgzMeynzleXkyO
         5MxIt/I6QkCl0ZiEf4af4nog/5Oj0dd6LE3Xo12kjcou4bZDTu5wV7UvgIFguTGqydVu
         t7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219825; x=1793824625;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXX75GaXTMr1qGEscquEidPOCC4V+kXbyCqTlbWwNJM=;
        b=vC+5gbQweaXhn740Yh5UeYERpZkitOSL8uNAHKLwi9Ii+oueSxnqn6qRKMb2wX9jWq
         c5WT0+fzz8yUH0bv4OSpG+ff2cVv/7uP7oEIXgdb/jwbJwnEex/u3E9AWGwH5ESyGdg8
         T0vq+n+MvBe0SCz/hzzNa7pCbB31G7bafxnX8kVx1o45ZFfG0PTeEIzn7xZraMIdWVHa
         YLIABjB8Z+JdhUvrqrnF7Yv9zWkISg7T6pHfZ8wcl1vwbMA7iQy/lR+yObwQpSMbtq7R
         cczjfFlbbBw0Ga62LPqRqpDhsKvzn3fg+T01Bs45PoNlo657gVwA6rgHZMzrxt22z7Az
         G9Ww==
X-Forwarded-Encrypted: i=1; AKwUvBy5Im3OoswVFPxEsW9nvdeZdQEqsq5+bcE//xhfjtKEz2iAYj86DOKqLqYRn8y+JzRJMm9QVXzCPLZ1HJTnjVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTrS9Rw2CfADLQeIfulRerT8AmGpGLKUA17sDjaAb5jnRG44P6
	i8FV8HrqpRg4cltaDp81C0PkSQlTcWBUTB8Sv6r1R9ycF0zcHFZmjqhVbOFCDN7NNwy0d2o/Hod
	FJeXL
X-Gm-Gg: AYBFou3WAk9ma5brPi64LHDLUdGt9EOqlfP+lTvMWDfgN2IhpX7XEUVusVmfe0Iy8q5
	LQR1tKrJeZAPcqlwTX+nD7DoRED3CoNmht6yd2uboQhFgbVIA9i4S7HVy9diOzN8kJTD4mSZBSL
	HP9Qi5Da9EhjOjy4rL4aWmjb8+BtdCO9TEn7dwEQ9VhcWz19vUlLH4XmQkLjlzC1kdrQc1uGUfz
	0UanyOxWgqHEehZ8ZWM5FrKJXT1L01+Akfn4SUI3UFSLMY3OaMLPEjcgraHpKP2caikx/0Bb7Ef
	jnBDJCF+H4uK5jvIC8Sr4dBOQ6OjJwJCWCzEhXU6LT85ise46nDT/33VzI+1wpltqiM+StXctRV
	trcOLn0bVNPtodTdKSHYjGeVe/IxUI7wzp9mw3rKU2vLlir1VumbBsxU/Uz4iVCE2eVVV0KhBug
	Gmzr51vzm7Inm5/qdOl72coyN4V+WatUDmFVOc0wlQW6elkk6LpbpYEeav6evqvRLRQsykTtCbg
	61qdUGs4Rhd0YZdETb8M5feU604TR7lw4HxGP6z8kCWayqxc7JOAROWONOG1qhhyywWiFq7CN1x
	Sj9SaHh7NBqx6YsYKqcZliLeris5cbPsDLxJ5yyzOw/t14fw2C2wMieZojUmf6C8gizeplOSkcA
	dcgb29H0USdrxK1Uy3E7EXObMeZuZ8SsfC/osW37bmqbT/PscxUN2PXLhvj1xRgVoTQ==
X-Received: by 2002:a05:6122:d17:b0:5dc:d0cb:7d74 with SMTP id 71dfb90a1353d-5ec4caa66c5mr1844102e0c.2.1793219825199;
        Wed, 28 Oct 2026 13:37:05 -0700 (PDT)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f931911sm3001789e0c.10.2026.10.28.13.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:37:04 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 05/10] liveupdate: Don't WARN if tracking a
 retrieved file fails
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Christian Brauner <brauner@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261022225035.377445-6-dmatlack@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-6-dmatlack@google.com>
Date: Wed, 28 Oct 2026 16:36:59 -0400
Message-Id: <179321981903.1894369.6363169044837754945.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=9m6WB2manDNmHNkWWaupqwLfpyUxuStC4em+E8XaZ0M=;
 b=kA0DAAoBu3coTNtzet4ByyZiAGriXO2ivBwzasr17tc21/VkmA5BpaNy5weddLAF0Xq+WI3XQ
 IkCMwQAAQoAHRYhBEExqpPstG8a8H82Yrt3KEzbc3reBQJq4lztAAoJELt3KEzbc3rePOYP/2jt
 cPdYHQOGemXNJXRL59xPkeLyW7o1RN8hKWIyLuuP6Ug2pE2KyooLVMtwE8WNXTanREsAnV4iWbp
 18DhLZiTVBE5EkM6/8QNoxAZkBSDn4wK+ams5b+mlNPwywvyaEBEZ5fKKScmaNRUCAewpICwMLl
 6MMU6jooZU3sPMbiNKXJ4N2gI/L88JDIsa8rjkt77+VOWxdfj7cWe04yETLsWkQM10Hks9z7s9X
 ZOWlM1lzsqqXduBkm7t8oYWd3s3WaFw0ZhWD3Jv1SpMGSr1ClSSLecw81Ivne6/TsksTGXzubO7
 calTT+OWXI6Ax7nJh7l9RnbbkISeFgCF1AvY+QBFDjjZWEJTG7Nr0os9xXrFOrGET7jEoXdiT7C
 jarfhSDZOjpTla4/QTgYy5aknwkd6vMf+cTDxSZr0ncV/ztL67ng/SAo+XY2X+LJh8NaLiSyawU
 kESqNdn9F8zlYnkqd76MqKhhnynb2Kl39nk67LtMiZ67kERKg2TIvDyk4/+htE8bVfSCyWrbbza
 9rmcRPjKqVYqc0R782X+ScurAwX9FCOEeZ1pGnyfxpn+KWMPQHz5KhiszhkuX1NuJ3nRTt8rwYp
 TeWhBbAFasJNbFxFUn3xnNwQ/MPrJYtpe1iwAqpgdB5suJ6Wk564LOw8NLWPTuZy1U3/0vj/x6P
 YsuVI
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Thu, 22 Oct 2026 22:50:30 +0000, David Matlack <dmatlack@google.com> wrote:
> Handle a failure to add a retrieved file to luo_preserved_files instead
> of triggering a WARN_ON(). xa_insert() can fail with -ENOMEM, and
> userspace can trigger that with LIVEUPDATE_SESSION_RETRIEVE_FD, so
> warning about it lets userspace crash systems with panic_on_warn.
> 
> The handler has already consumed the preserved state when this happens,
> so make the failure permanent. Keep the file until the file set is
> finished, like any other retrieved file, so that its resources are not
> released before then. Finishing the file set then erases the file from
> luo_preserved_files, which does nothing for a file that was never added.
> 
> [...]

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
