Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232863;
	b=LqdwW4aKmr9gqo66NnFi98xr5wLyLnUi4b2TTG3495hY46j+3zwGePqkm31RY3FL1uHw
	 bzT27CdFwbTPaJe/zUJJcExxvkPmRAuBAGbRZaOTejyrtXibOHVfvuDUeX7mgdGtOC7Lk
	 QUKzhw/K9YX5Zse/M5ZWetnhPkxH57oee08rh4XDebuLiQNX2FB7iCwYKFEwdxv4UHMwO
	 ZW/9lvooD9jdWTefeU/OrIj+elQnS7HsSp424EEAZ8T5MGFMAPJxWgwIvlKNgRRh1d3JE
	 G/wzuTn75/RA4EcJ/c+mjxC/j4r0lEIt0JBYEZqlPLMjYGNnvYsRLI25z2xPE46ikVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232863;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=9Oiih5slTZyatARVLusbIPjFVP7cGpNfYHK2OPkvmRA=;
	b=z8hxCKrLZnmGdo3qDc4Y0Di3yW8a/pfo0aaEhQ38r1zFs2r8KYgPdxzp8zQ25cFt653c
	 JojyLFuQ9WbfZmmaeZilxDTnZsZfIoiu9Mvcu0Jk/kUFACJ4h4Nbh5MHGjN8Hr5QP16D5
	 9ATsatcM9K4paoBboyydGrrayqt134R2q/SO0onD9MNUVCb5KU6WoIzIc7IrL59ZsasnP
	 34He6tp3qlRoZnUXbWVtHFOocGmoBqVaY1SHSPUNsKRIwiv1gLj1p8Gd1BvBan5Y/nqUg
	 2k98Xd6UXu768pN+xF/E1aW6iNxP+MjonlGWF7sUkax2hAEC587758eFbIyyVJKUojw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZwB0WqLr;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EA0606A321
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 14:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5EA0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZwB0WqLr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794232862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Oiih5slTZyatARVLusbIPjFVP7cGpNfYHK2OPkvmRA=;
	b=ZwB0WqLr6VFEWZYkFPoje9nwFOzZF6Oo1d6V/Zs7Pl67KGdyhRuvreAqycfV1F++ZKfiAR
	5PTamG+FKuzs8+NJ43ymUVFnEOlg3guNnV/ll+l30W6V8d+ZIrZBWzmRrLB7BvFPmCrKB8
	w0mSylDtEP17/ydvSmAPTwoGu8GPpgk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-295-KZaldpeVMb2chDoXjrJOXg-1; Mon,
 09 Nov 2026 09:00:58 -0500
X-MC-Unique: KZaldpeVMb2chDoXjrJOXg-1
X-Mimecast-MFC-AGG-ID: KZaldpeVMb2chDoXjrJOXg_1794232854
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F27B180059C;
	Mon,  9 Nov 2026 14:00:54 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D6FD330000E5;
	Mon,  9 Nov 2026 14:00:49 +0000 (UTC)
Message-ID: <36a27d0b-a4d8-4135-8796-525898b91807@redhat.com>
Date: Mon, 9 Nov 2026 15:00:48 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 14/14] selftests: dpll: add reference leak
 tests
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
Cc: Jiri Pirko <jiri@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261109093523.931201-1-poros@redhat.com>
 <20261109093523.931201-15-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261109093523.931201-15-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 11/9/26 10:35, Petr Oros wrote:
> With CONFIG_DPLL_REFCNT_TRACKER the DPLL core keeps the stack traces of
> unreleased device and pin references in debugfs. The entries do not
> name their owner, so add library helpers that snapshot the entries
> present before a test creates its devices and fail when an entry that
> is not in the snapshot still holds references afterwards. An entry in
> the snapshot belongs to an object of another driver and is ignored
> even when its content changed, since other drivers take and drop
> references while the tests run. The teardown of a device releases its
> references before the write to live returns, so the entries are
> expected to be gone at the first look; the check still polls for a
> while before it reports a leak, so that it does not fail on a single
> read. Attributing
> by name means that a leak of an earlier run goes unnoticed and that an
> object reusing the address of a freed one from the snapshot can hide a
> leak, which is accepted, the entries carry nothing better to go by. A
> second run alongside would have its devices attributed to this one,
> which is one more reason for the lock every script takes.
> 
> Whether the tracker works is probed with a throwaway device, which has
> to show entries while it is live and to drain them once it is deleted,
> so that a kernel without the tracker is told apart from a broken
> simulator and from a leak. The probe runs as the first test of the
> stress script, which gains a final leak check, and of the new
> dpll_reftrack.sh, which registers a device, removes it and verifies
> that no reference survived. The snapshot file lives next to the lock
> file under /run, for the same reason the lock file does not live in
> /tmp. The library mounts debugfs when nothing else did, like it does
> for configfs, and the selftest config enables the tracker together
> with CONFIG_DEBUG_KERNEL, which it depends on, and debugfs.
> 
> Acked-by: Jiri Pirko<jiri@nvidia.com>
> Signed-off-by: Petr Oros<poros@redhat.com>
> ---
> v3:
> - say what the leak check waits for instead of a concurrent dump
>    holding references, which nothing does (Ivan Vecera)
> - follow the move of the selftests to
>    tools/testing/selftests/drivers/dpll

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

