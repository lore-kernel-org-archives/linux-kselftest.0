Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874FA3F1AAD
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125647; cv=none; b=Zz9srtmNfEx8tRL+WwJQ22RityHVwi4yUTwMazZsyHk+uHqQ7ZhlSq2vNZt6xIjPVOb1cdbVwdTtuBeBJt3K3WqTK/SAKIzVeh3gKBAHvY1zA+37uCcfqlLmPl1nE1JJYomt/APwfR3/m8AZF4K3T6jV8AdmdSqSrjYV5qM9Xno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125647; c=relaxed/simple;
	bh=gJ13UqWzZEDyerZ7/qjhoITgJwDdLZizvxVmEuBRsmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnraZZNMBl7NKI9I+umIDq9utMl/bLMMkJTTy9V3HBBgf69sV9IeeBoTKm3LzCR/TqQtYXnuF7bfyXURA1Cm+GL8bRJ54Pk9TrpsDYCeqoUVXMUiV1b7G11Df3kAAk+738+xiatTXeQ5qEh5TsXkVgxsnZZBhBEFNVbkIUDl4YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgREYWvD; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgREYWvD"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbee846deecso755741a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 00:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787125646; x=1787730446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CWkEyoxZps0PdiXw6wwCg4ciwx9ABuctTL6IGXUaTDg=;
        b=KgREYWvDzrOBY7IhzEyYqBxOpnD4cuLwwrUzOBEcGL+ooncNXEe9NzAU7L62/SM84f
         Usr8gCmLGsta+PndAhSQQEmx05JpMDZawc23u//eYE6PFJIIqxgrKk/zO8PLTi1gCwSo
         3+uEi6Dx6Hb01DzSZcUnjEJxwKtFzghBN9f6uU+0yAN+M9kINbAYWLN+/yBTtTvVJ95+
         iBI0xnJT0yO+t9Xv7zOqgdYwlbJ7nrUJYo+EJGHwRhkHiOlmmONeaYo+xCeNM7RLPStb
         WBfMklzKbjAjlw4tz0hd9PZFOH6WNi7ScB9M1DtsFmF07iPhZL0JMVjCD73MS6qRRbYu
         5xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125646; x=1787730446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CWkEyoxZps0PdiXw6wwCg4ciwx9ABuctTL6IGXUaTDg=;
        b=UlLg+g7KeP8CVvJBjqynlqnQwfz/7bqqORWSkvgxuw04TlwSL0+oDqXVd9hFAb87eb
         uxsOAxIbM/fobfvZ7jYUyBB3u5NYDpknYNQpy1t8pgbhyMwx0R5J+g2QMfdg9AUyitiW
         3IfOCZYwumBS4/VJK8eqapMU7WsgCuRKyp5V16Z2Z+wi9v0iLV82DQlqG2Napw9ns90J
         dD3rooxXqHhbH7SLV3D1+w/C9oBPwfJZyEk8OKG131klnLkvwCd6gE0VI7NgVLfyL7Vt
         aCCNbMnk5ERNsbzvpRu/f0tpaL5axcxMENPJpZ5Webs9FWGQBwKR5shfuXhg19/kVMPf
         a2nw==
X-Forwarded-Encrypted: i=1; AHgh+RrYXe22tb4VQNxHhzo1rIS0AAMakdKGZij2ZxTSZ2XEUwJWOJDw2TgzhBxv0MPIFnz4UGcmXk82q/DuGT5xKCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRJ4deZfHB14EVF5inxvR9/vGRMl+E6XYPDvrIFZjVkYkVQVwZ
	ONIVn3E6fQYCdxGo40CdRawYTeMe9c7ZJU9pL/N0PfoKc/qdoE0MnJCak8PmjNiK
X-Gm-Gg: AR+sD12AYI5MQsvJ98rSrCJ99wawYu421oT9DEqpdAK40LRjAK+PdIzJMviGh8rfhad
	evM9rhz5OMC38GFAUdW9H+BX3HxiLt0y+frGA+AEQGPbKdA+QsQmiCMiTFqiUtQGzaqMZPnfmKp
	Zr2YMKy+Rem++55wVCVJJMG9hA6meUaS9fDpHlQGpBM4dmARYkd5ywRlFYcR6jm++mtdKEs/q/8
	wCdmIkcNMcjmW5WyjLa+eCjQ90CqHBHp30ifrXdBfYQc17hV3d2Tv0mKI10sRn4fiwG3wz9KXuK
	pObx82D2aa0uwxrYoXOYZzTVr8fxlnlTP0L6rqbU0AjJ3LV6G5myTUQPomEM64jC40evpJbG+CH
	jXF7VdU+tIgJHpMvmyHBahrJI3CmU2cS5RWfM2VKQZ/pRSQj3aeeaEdHKWAmjujcOsoIP8z1jzx
	Za3SwUxhR3KOMmQQQrneVVhTLADu5u+wEtZXIQEhcXKJ6WrcfhS1wJantuw5oLUEAvNlZh6PoRf
	VOjtQvapYM=
X-Received: by 2002:a05:6300:4c:b0:3c3:88a5:83e4 with SMTP id adf61e73a8af0-3cd011b1b48mr6380483637.10.1787125645848;
        Wed, 19 Aug 2026 00:47:25 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77be3sm4151708eec.10.2026.08.19.00.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:47:25 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hemanth Selam <hemanth.selam@gmail.com>
Subject: Re: [PATCH] selftests/mm: remove the local PKEY_UNRESTRICTED fallback
Date: Wed, 19 Aug 2026 13:17:09 +0530
Message-ID: <20260819074709.1345730-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <aoRto6bT3Fv0jm7k@lucifer>
References: <20260818114945.1312987-1-hemanth.selam@gmail.com> <9e533fcd-c80f-42df-847c-c15c4e3a1a70@kernel.org> <aoRcdLGWaNhUFIPU@lucifer> <277db0f6-6161-4ff1-9540-7b1eb5f7924b@kernel.org> <aoRto6bT3Fv0jm7k@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Aug 18, 2026 at 02:36:00PM +0000, Lorenzo Stoakes (ARM) wrote:
> But it might be worth checking in this case to see whether the problem here
> is in fact that we need PKEY_UNRESTRICTED defined over there?
>
> Hemanth - could you check please?

Checked.  It is already defined over there:

  tools/include/uapi/asm-generic/mman-common.h:88:#define PKEY_UNRESTRICTED	0x0

and it does reach the mm selftests without "make headers", through
TOOLS_INCLUDES.  The path is not obvious, so for the record:

  pkey-helpers.h
    -> <linux/mman.h>           tools/include/uapi/linux/mman.h
      -> <asm/mman.h>           /usr/include/asm/mman.h
                                (tools/include/uapi/asm/mman.h does not exist)
        -> <asm-generic/mman.h> tools/include/uapi/asm-generic/mman.h
                                (-isystem puts it ahead of the system one)
          -> <asm-generic/mman-common-tools.h>
            -> <asm-generic/mman-common.h>	PKEY_UNRESTRICTED

I built the pkey tests with KHDR_INCLUDES pointing at an empty directory,
that is, as if "make headers" had never run.  They build, and cpp -dD
says:

  defined in: tools/include/uapi/asm-generic/mman-common.h

Pointing TOOLS_INCLUDES at an empty directory as well is what breaks it:

  pkey-helpers.h:188:30: error: 'PKEY_UNRESTRICTED' undeclared

So that is where the definition comes from, and dropping the local
#ifndef does not depend on "make headers" being run.

The one thing worth being aware of is that the redirection into
tools/include/uapi only happens because the system <asm/mman.h> includes
<asm-generic/mman.h>.

I had a look at the history you pointed at, thanks, that was the part I
had wrong.  If I read it right this is exactly the mechanism from commit
e076eaca5906 ("selftests: break the dependency upon local header
files"), which added TOOLS_INCLUDES to the mm selftests so they build
without "make headers".  So for this particular macro the value comes
from the in-tree snapshot rather than from whatever the build host has
installed, which is why it does not vary per system here.

That said, if you would still rather keep the #ifndef as a matter of
course, I have no objection to dropping the patch, the guard costs
nothing.  I mainly wanted to answer the question with something
measured rather than assumed.

> This is incorrect. We explicitly do not have this requirement in mm selftests,
> and they're often built without having to do this step and tooling has been
> provided _explicitly_ to allow for that, which is why this kind of thing exists
> right now.

You are right, the commit message was wrong on that point.  v2 drops
that paragraph and describes the above instead.

On the powerpc header David mentioned, I would rather leave
tools/testing/selftests/powerpc/include/pkeys.h alone.  It is not the
same construct: it is an unconditional

  #undef PKEY_UNRESTRICTED
  #define PKEY_UNRESTRICTED	0x0

next to other powerpc specific overrides such as PKEY_DISABLE_EXECUTE
0x4, and that header only includes <sys/mman.h>, never <linux/mman.h>.
A probe including just <sys/mman.h> does not find PKEY_UNRESTRICTED,
with or without TOOLS_INCLUDES, so the definition there is load bearing
and removing it would break the build.

Thanks,
Hemanth
