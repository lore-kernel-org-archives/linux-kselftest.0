Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C621A326951
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 00:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790641229; cv=none; b=iQ2nPjbUe3qF4hKn2raNbe1g6btrLo8LLH68MfiL2WBZxQ82gQp1vCmZkgq1yydUZsfE6E4NWKonI9IQpAwGyUqFC14AaSI0TwOaztxel6N4Bpn+UCUI19ICi8V4/dZ7YqkcHkqBOHdl8Z5KMkpieP+XMi03tCjwKMAR5Q7FwgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790641229; c=relaxed/simple;
	bh=JB+Tmj3rI7ONx/tLDWlB6lOOPKvo5RIyeaTTXknKqpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wv2uiRJo7UVgUVmSZ/VT5G7onrNzKKguL8M1QmpcSqjzT7PulJzoNp/mO1g7O1pKIyWwWlJ7wywVPbWpD+WIalDCJXIdp33EGOZ+maNfVix/F3k/uNfW3M4c6R8+0fAbcbiVeW+IM4K6qceLjsM2/vmnCnk6ulb780A5aXM8xLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qfCcEU/Z; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qfCcEU/Z"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a498cb99b3so191733a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 17:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790641228; x=1791246028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JB+Tmj3rI7ONx/tLDWlB6lOOPKvo5RIyeaTTXknKqpc=;
        b=qfCcEU/ZJefY2FkYRjt+IYVPC6XR/X8Jq8r6y6Dj525Y3WyI445bSnj+dtQpXzBz4Z
         Toa09reD9HGGxZkZpr0674gXE0ykxhpbTbvVOCc3OlopCciHKhvwHS2UxrXF4M/1EtsC
         cxT209oSgEiIMUm3gqfIcp0Bp3MdMYbWHwruFD3ctr//ypiEzN6mUjNmiAoTA1BBza8y
         6uEhXOr+UOi4mgad8CbeAe22e1yQLMlaVWyKEic8KQu/zd86xMT6+WJ4DLCvutODshK2
         c4L+Wg89atFd4saEmRNM69ugxUss20kdz24gjxG8OgLkjMSeLDcoyB/wPDRPcsriAmHq
         lDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790641228; x=1791246028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JB+Tmj3rI7ONx/tLDWlB6lOOPKvo5RIyeaTTXknKqpc=;
        b=Q3KPtKxDVUAdX/RLHEvLqvpvDflnf+AWCCkbJsmGQilgbkXSFMSUx0U4rMpWEsm0Xw
         gg8qiUtrbo8pKlrTOFYki/advA0W6XJc1s/4XKUZbDv8pVExJ+xl98tOU4eLQO6oXWdb
         AMuJkfM1mxs48cwveZ51OOzyQaeZ/sKb7Ls5YD+ocgpITRoJiQ3WWk+m+9NeiYXjlzr9
         sQ7WwNmiaRwJ51h2YxUCVjYF5ACNLX7auLDHputhL8GKK0+1zl4V4OPFwI8gGRtLMG54
         VMD+0AN2nbFWP66rAIcucUUlvc032vr3Hj8fKA4Ztrv677soxamyJPQ3Ods6Tg8ww45T
         LaIg==
X-Forwarded-Encrypted: i=1; AKwUvByz4+YzWd5n6wz+T1faiAYpIiBPnRdNB/waxR3DmR2QeVIsFLk3mvQ0u4/VoZ0i1PD1Vbrv94Ex1VT5jOBFH2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7iz9OIy3Ap+EVKWvEl4xJrt/WBgSTXhBa6nlJkUJ7JzP7pDOP
	v/vstlQOTJIS/FenrbqTBhsFmgp0UE6gupttB5zgTaSwOHT6LXJvKvQ=
X-Gm-Gg: AYBFou0/iXRwDo1SFEhJyflGWW89318MipH0dXEWlDtkl29CjyqU9boEtVv8MX4CBQQ
	I/EUiqpMfeofVFc8EE1Oil9KfenXX/JNl9UTIpHwLtLxZRuXGpakWE6g+rppz4KlSXB9HH0pvMr
	tfurVbjuhYHV4iebl7pE89bbzQC7aymRfmxmNJFngIkL/bLMxEo1kVGElTr7j9VS7dQhXTrJUp1
	wmA8eNj2i1NrK5pVMPtVczntIzdCJp1+Q2Td1c09dAi9JRMoKLquNQygeQkFx1LFlmQgkhgqjIN
	e9GrgvoHKjN4L8J+Tk6wVrOdY+G/EsYF8zcGw+5c+WUYer3sfcmdXDaOIisvndLyfAJAHwWwQ6i
	Bjeq+lFuYSl6JmKMSboYothQa9asEyo5K+JS+X1hTUrusdh4dHNiRgObgeRTtWa8RPmCTzmY9gj
	E/y9twDPxm0N7vc9QRrFNgiFrHGG9PPHS8o6ZSBbnp2hLJKNC0kOePPBxQsP92LnXUuptVQfz3v
	DVXPEzzA7OrsK8qjzOhs7dOo9Ll0JBt8JziQw==
X-Received: by 2002:a17:90b:4d09:b0:3a0:c85a:e602 with SMTP id 98e67ed59e1d1-3a0c85aeba7mr6091841a91.9.1790641228008;
        Mon, 28 Sep 2026 17:20:28 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:712c:b4ae:f935:9398:3170:36f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497718037sm2047605a91.0.2026.09.28.17.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:20:27 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org,
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
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v3 2/2] selftests/mm: add tests for UFFDIO_MOVE of a uffd-protected swap entry
Date: Tue, 29 Sep 2026 09:20:19 +0900
Message-ID: <20260929002019.1847080-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cc123233-5b48-4069-8f84-f95301a83dcf@kernel.org>
References: <20260926124145.2878520-1-donggeunyoo.kernel@gmail.com> <20260926124145.2878520-3-donggeunyoo.kernel@gmail.com> <cc123233-5b48-4069-8f84-f95301a83dcf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 28 Sep 2026 11:11:50 +0200, David Hildenbrand (Arm) wrote:
> Why not combine it with the protection?

Will do.

> Why not do that at the very top?

Will do.

> You can set that all already when initializing aboce

Will do.

> BTW, why do we fail the entire test here instead of only this test case?

I did that because the test is about the bit after the move, not the move
itself, so a failing move is closer to a setup failure. I thought it was
better to stop there and let whoever runs it check their environment
before running the rest.

But having gone through the file's history, I see the direction has been
to skip or fail just that one test and keep the rest running. I'll change
it in v4.

Thanks for the review!

Donggeun
