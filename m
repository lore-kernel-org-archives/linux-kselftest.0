Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B719C44838A
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787673509; cv=none; b=KnJX8ZOWhnd1SOKd8Tx7SWS+JL/4qujnGwMFrFW12BNB5Nm2JCvrNt/1JESG3J1yS8b/j0LpKiajBquJ5rH9uJqwMRxg6B/M+zbn87D5q1TV3Jf93wYBKiWqEcdnVPuTztrrLkbaaafy7xOoFq27iNvGvFFhISF1vn8FWKCY8zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787673509; c=relaxed/simple;
	bh=hEuVyjDnFoNd6JtTePNviuCwOub2ts5RMN4/JlUevdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDQvcotaZtNpU9cRvsLNMtAUpiFWwHRMx+7ko8Ol7Ufz3NKFl1ywFi7tw37ihrAbPDVEvJVwqiBE22wYkMcs5JLaGwfod3NCZ/dNgJNkq4uNWIkIQIbpVSUIIcZkB8VIUTJwyFyL2vU7jKsXUZLxXJM9WKOs5tXwXbggq/QeuUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ki3+NcCn; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ki3+NcCn"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so5479a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787673507; x=1788278307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9OtZs5NBq0Z3O9dZTmybDq9m9YVYbLUmax5nexoEVpY=;
        b=ki3+NcCnmgqHGMwPMwFTrRJjK+GDlK9sU0sUuehUEG80pVvqWPr7GjfNWWJehoU5vx
         0OCCDPg3dq+ntAr5MvL1Z8IrlcUIXhI5joMvdpsyHnzoYoVzWQm3iScPskv7ZC1ZhHDZ
         TsRNoLUZ3IDK0GhNmod607XH2v519kroPcZ+WUiwZ1boGe/0jKKhQ3VsXDPK/FDm6fQS
         ZQeG6RcPrJ++K45vDiqDvFClEbShTnQ6rx1Dy9+sh1wM8MYCWruuPdiOX+1jnBAIm7Fs
         oQlzNT1x6lj5mZLTtxOPzXKPHcxkdk/LH4u2K7Pclb0fR4qkjHotsEnXQFtsJvHbvQfg
         Goxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787673507; x=1788278307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9OtZs5NBq0Z3O9dZTmybDq9m9YVYbLUmax5nexoEVpY=;
        b=YTzaM71lCJ30SI6K3po2G2yyGsZhqsm3AuC43GCThZrPwXVrzj32XWRqjjaTKe+0fw
         gOVWZw1ZyTXraePh9ZeDQ1vaXN8wP/eop7BxgC5oTV9axo/RxBqVzKTytDBHKXjFlIek
         ibtZtSxsjQ9LYMc62Wg2nj3+HlUIVz5kV3DJO8unCOzthkF1K8PGOQiMCyqLuWW+/00r
         mes4Od6qpES9HTmQXxflJCdYFjo1PY1k0xHplt5kzfgO5JebpUw1TGTVlhMzmKWuMArA
         6gdeyC3gtQ9IwqHjBuK0NUz2pcWyhLL3t7A8i/U21OiflHgoFWgoqT81Ty5QfT5XIuXG
         XLfw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5oCSfnTT2LLS4zt2WX1CJekesZw79lnIu9sm5/Jyk42tA/Wd7ceJWO9f6tWsH0ViMsqeLtWF8cajdqleAm6Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m+l5qPEb4ivk2qsX2oiH4Uhxj5R3X5Ra08ybK4ZqXqeHDGw+YT
	6Wg0dW/i6kGhj4fcdCvu0chCP+WRaZHFVETQK5moz2F/U3ps/Ruj+Vi2
X-Gm-Gg: AR+sD11L5vQSzU8JQlKbG2wic8J8yTc1JuIkIU80e57P6Ut9fhmBYa/mOiZrqWqiqq3
	749qTcsMx3yHjuAoRqqZl1/YZkG0VHDKvPfwp5Do4E8D5n+XM/3F+Wm6xGfjBpbYhwRBuqbVK6B
	jBTzS1kVzgkkKWQpUbeStGqJy1KSJJrcBZv+7hlnpVsBXzB4iAaBp1WYJKe6RAyRP9asLh40E3P
	pmPkVZW0uhT2qHv51MmY7dz20ugRTgzhq3vm4KtpJCjE/UZzRBHEowES94h2HvQxVxElJmWGzGN
	5Ey03PxM+7p4meBbQt1CBHRAMxXAYWlz3b+fuKnPaKT5wiI+taHsWA1HPAwnlOTGS0zWgy0aX0J
	8PhCaI7kBQjGj1JIUtcFrt7/z67mAwjXUC1hL4P/x4jwSKz6gFGrK8y2S2YWzI+yS/F801XSl2C
	eK+bmNJf3uTxiytwtDlkcvvbRZZxmgWnyG1WWUFMgizzqeeCP6DqQevBdcFF1Hent7ToWjmXHFm
	+ZetNyT8wE=
X-Received: by 2002:a17:90b:51d2:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3966d21833dmr335850a91.6.1787673506904;
        Tue, 25 Aug 2026 08:58:26 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9036c85sm148587c88.9.2026.08.25.08.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:58:26 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: ljs@kernel.org
Cc: david@kernel.org,
	akpm@linux-foundation.org,
	shuah@kernel.org,
	yury.khrustalev@arm.com,
	kevin.brodsky@arm.com,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/mm: remove the local PKEY_UNRESTRICTED fallback
Date: Tue, 25 Aug 2026 21:28:02 +0530
Message-ID: <20260825155802.2804785-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <ao2nFqGevXIa3l4c@gremlin>
References: <20260818114945.1312987-1-hemanth.selam@gmail.com> <20260819074717.1345749-1-hemanth.selam@gmail.com> <fd193070-af97-497d-82dc-1f0fa1172fd7@kernel.org> <ao2nFqGevXIa3l4c@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Aug 25, 2026 at 03:36:36PM +0100, Lorenzo Stoakes (ARM) wrote:
> Since you said load-bearing in the last email - I do have to ask if AI was
> involved with this.
>
> If so please adhere to kernel guidelines:
>
> https://docs.kernel.org/process/coding-assistants.html
> https://docs.kernel.org/process/generated-content.html
>
> I.e. add an Assisted-by tag.

Yes, it was.  I used an AI assistant while tracing the include path and
preparing the patch.  The builds and the cpp output I quoted are ones I ran
and checked myself, and the Signed-off-by is mine, but I should have tagged
the assistance from the start.  Sorry for that, and thanks for asking
directly.

The respin will carry

	Assisted-by: Cursor:claude-opus-5

I will send it as a new mail rather than in reply to this thread, as you
and David asked.

Thanks for the Acked-by.

Hemanth
