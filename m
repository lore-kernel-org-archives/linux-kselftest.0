Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175973A1A22
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406702; cv=none; b=evVZISLbmaPGXwSIFaMrY+ub1Ces9xCYMJ94RRJ/gk9k1miQFEXnwa4Fkjh4/MVHEltM1WbQ2LNOTZHYH75UwoTpgtbthKdHD53WOhpoyQFYNfNUFFAw92tRD6IgAq8Ef4rv/qWqj6IB5p6VRNTdgEz1xra5OEEmFC3DHYoN1Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406702; c=relaxed/simple;
	bh=PtlgsNXnmfis3ceY240pb1ELF3pamHCPllFSka5A5+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwO03suxAURpUVDLBSVUumw0Hj1T9ymXBkNLlK4Q+MxS/vvopdZfTe2o4V6JIYILV2WVmXC5jW5RB3Phz87UjjyHukmSJjn6qYkTO8BQFIwF2i57648OEdMtOZsm8KNlnjKIdbryTEOPxXjBtDoifgcVa1P8w5nBeZCyxkL32KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnlhIxjb; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnlhIxjb"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469f204f6so779300b3a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 00:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790406694; x=1791011494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1uflVYidz7MNBUBcoHSIOw+jh4ssEiqibOfcA56ewY=;
        b=dnlhIxjbeka0hiFEsy6IJsk6y0sXeZ4a7i+9tX+GS0hO61X7cJ0MVk48JjuAkKH19X
         9ZDxu5p+fq6xnO6CtNqdRVeaMqjhC/AQmihuP7UJYHCSqbG4gH75Po1NpSNtiPbl3CMR
         zghf1iKF8ibP+YogLazMlaXXBsyBHPoDMyRQ9lPAXBYLm8OAGiCrumL/R5Z5wBkRtCEe
         IGoJa6hmlbTrjk0sKUGVWaMHey0wwOq/KigstkHqLm4NTz2twS5K4t0YGj5DC7NR2Ix/
         EmE2mTzmFllqcXPZaVe97W8/Gysd1KTBDWFSmjG/lGrko4pa+eJXiKTtcGIgbeOLRzPp
         H/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790406694; x=1791011494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1uflVYidz7MNBUBcoHSIOw+jh4ssEiqibOfcA56ewY=;
        b=VLsD2RIsdd9yBX/edkq87VqPYjWka+PaIciUjLNrQGZLwXLDK0oAO1yZPOuOELHCFJ
         PPYpUjfMqnqY7UHr44BJLBLKa08YTZBZCzwqgUnKMjPSd7AGswBNMtMXYKmwaqrJr1ND
         vk7MyCwkMzo8w+TmnDtG20GM4zWxxgwppr8XACPCvnbUAnI8taiHTGmBxDb1080fglGu
         OAP3R6HodRfcUhcvN18mMOkV0M7eANK4c+yYHj2CyDhh6/kN7bhgE3bSAEKT+7ryW980
         axrqz4RESPKQFRxIdGL/DscD56tYtg6+5TGZFxDfoQ3twHB0rPW3byX2mk1j2+3/0M4d
         cijA==
X-Forwarded-Encrypted: i=1; AKwUvByvLUVug0O+1rIgo4aP6T/KTb32B10oEKtKhGd8B+SK0ANxy56zVPJUFZSQcP+FsugZDFDVySFkGjs2cXUJUAI=@vger.kernel.org
X-Gm-Message-State: AFuF++lO+9uMEcE2Al3Drmw8NYmdklER/UxMp9NEndzXEqq+Wqk7LL9i
	P/W3DFY5pRQT9Wqp3edHt8QG8UPokOo25BAOrvtXJckAAErKdt0vonA=
X-Gm-Gg: AYBFou35n/UBOufE7rTaQnyqej/DxPrel/mEPVDQ8j8JnRj9+Zgg7X+oUtN0Ou0CLzT
	sqPJA1kTthpFd5UayQjKIH0ZPi37NZsc1tn1iyGYJSZx1x5TDKHCl6eBQYzAO/gKzUAjsn+9CwG
	jBHWv4FG33Y9q7gaD7m8SrWPPcqhqkvCYvlbqAEqGDwA9BpCoPo5CiKwlgCon0aiIMLspRWKOmm
	a9RCTxUKb+yCbzO6Ae0c+W0pd6085I8jXBJ5N0JoKBoSfMfTp2DSbUZzLD/ou8hJVHPW/ZAgrdP
	KxighQvpWia3VnqFRUyCMxrKGlHHoQg1FfbByT19qQfX20ZOXarj8MrambFP4wVzrB24vCEbvQY
	c1Tm+HBi+gY2WasA2+ayh5jFq0p+JLxOIWfUGhaxsjpIgXbkpz8M0OoMME7oBqowJCSEjJPmIW4
	Fn+q2HKvHRR6bAbh5jHnssPFE/ZHDvKCzLBiwlsOfdrnXd6ydskFdqoCxPsocpvNPZB1QBMRQan
	onQ7S94Yj+ef1TqpWVSKGY0
X-Received: by 2002:a05:6a00:b904:b0:881:79ec:a65d with SMTP id d2e1a72fcca58-88179eca7c0mr762226b3a.32.1790406693845;
        Sat, 26 Sep 2026 00:11:33 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feae8d827sm1971825b3a.36.2026.09.26.00.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 00:11:33 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kirill@shutemov.name,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Sat, 26 Sep 2026 16:11:26 +0900
Message-ID: <20260926071126.2869041-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <8f60eae1-31ba-4ff4-adf9-951240561f13@kernel.org>
References: <20260925042907.2330519-1-donggeunyoo.kernel@gmail.com> <20260925042907.2330519-2-donggeunyoo.kernel@gmail.com> <20260924214811.19ef8af417d37071ed8338c4@linux-foundation.org> <8f60eae1-31ba-4ff4-adf9-951240561f13@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 25 Sep 2026 09:36:26 +0200, David Hildenbrand (Arm) wrote:
> It would also be helpful to describe if this was actually hit in practice so
> far. IOW, how relevant is this in practice.

Not that I know of.  An LLM found it reading the code, and I couldn't find
a report of it on linux-mm or lkml.

> Will this trigger a kernel splat later?

Yes, with CONFIG_PAGE_TABLE_CHECK.  When the moved page is faulted in at
the destination, do_swap_page() copies the uffd bit to the present PTE and,
because the destination isn't WP-registered, also makes it writable.  A
read fault is enough:

  WARNING: mm/page_table_check.c:202 at __page_table_check_ptes_set+0x185/0x1e0
  Call Trace:
   set_ptes+0x67/0xc0
   do_swap_page+0x990/0xfe0
   __handle_mm_fault+0x7d0/0xeb0
   handle_mm_fault+0x9c/0x250
   do_user_addr_fault+0x207/0x650
   exc_page_fault+0x65/0x150
   asm_exc_page_fault+0x26/0x30

That's on 7.3-rc4 in QEMU, from a WP- or RWP-armed source; with this
patch applied it doesn't fire.  I'll put it in the v3 changelog.

Thanks,
Donggeun
