Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E0F3A839B
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 08:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511884; cv=pass; b=RDyK8aclfCT+YQGwHYQ4XzSQv0P0WPRPvhm0NWICfTSXaUDegqks30AbYpAuxnYQ72g+wJ9ilsMg3WP8Xd3//AMu5Ywo74Omh4y8qdQGeiWI49BprD50HqTBjKUYGEFzF4OT89TJi7yC0ZxKuMrHmrNufbM4bFT/YePDbv3wDKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511884; c=relaxed/simple;
	bh=el9C0eC2AOZtIteG0TNFb/RC0Pp+DPvBNH48NZ87dWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlXCibOlLfJvy/A/O+olzbUZfpcW5KKROHzYZLlCsA1zLoBUYPDp0iKkCpv1z0enbI4LWk8cB1snxpBgrG0dKf1khSD6VSrGQpronrqL1Xpf37MD3B7qMq4pjbTAcRhUHeSJIXUI8b/Y1js8v7EUGHQDnLDxMtY+y5g5j59PY0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsDTFALD; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsDTFALD"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66c711b7f2aso626638d50.3
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 01:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788511882; cv=none;
        d=google.com; s=arc-20260327;
        b=MhzQFjy/sSYcAre8RKq8aHbVpGAo6BbaZEPnKnjNZ3etsiO+i6YGCrn8jNC/VDwV8d
         1Ld8MfO9SJxOvWJ2D8JhZsl3YB2UMQhzin3jBuQQmZHlpJbrJ7CDOhitbcCoEMwFSis3
         3AhqQTl1NK6GBjQ5ul7j222nkOo5Jy71VFm38w05TPYyu6MelApsK6xmjilRurAAXHZw
         F6X9SLAQZbaca34Fo1nvYSU9AzYIEaR4618ASl8ZnMbGxrAdP6azsKFcEZaPIBgP0VGp
         2cZktB5SY251Q2+FE+niQ27myj2I9MhXgF0KNWaPvkdK0021sjoISHd9ARMhp8LBjUe5
         ehJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=el9C0eC2AOZtIteG0TNFb/RC0Pp+DPvBNH48NZ87dWM=;
        fh=v1OPeHhHVJ6KF/yq+ogBZZ0lfLYv54Tj3yDdLTvl2sM=;
        b=MUPJZI/a2ZqFtvAb71dnoDHJpGgeQzgO0IHNpOKssGm3R6RKeLqH367NPSGx4k/YAx
         v2xjbN4cJC+mERqqxSlopDVVv9mlViZfqPvUuiOYPMUp7ICyl0a8t03EqLBssKWIfzgz
         kJb+j5ohajmqyRtt8adYT7cUq9eoj+38ewQVbd+nXz8+fXS62qw9Myiw9iVKInNIuJ6R
         bsYooW+h1uLOF/IePkvwJubswjF0K883Y9+f0B7xGQ/vDdRCYd1Cd+c9qTjZWhdblA97
         WnGDzADkfp+4uJqmDP5HZvlloW3+5lb24u+zHIkTP3lSpl4i66d7ixt+lSyFVY/c74+C
         Tgzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788511882; x=1789116682; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=el9C0eC2AOZtIteG0TNFb/RC0Pp+DPvBNH48NZ87dWM=;
        b=TsDTFALDw4vsg1GN3g+UztVq9bUfuAKY8SIzq703SuedfYigVlMSf6jeA7JQqnvzo6
         H+bdIZiYYT2Id0IFRDBzF/pSegUpkX04c+5X/MDwrFyoNXITvDHTLSrW8BHC+m+KsTlh
         zyhiLtSj0nxFg/pCbyTDpM19NkKthyd2RAUgxwJ+4Bn8Q4cbn/9BlnxDwHjEWADhCtes
         V7MilISWIICAkfPebCopcNudegdQLPQg/C0wmTUwg9kYGcEuRq2m9nCL1uSYkLAMXp/N
         7hnYtLDQ/9EAXev+7dGUqNFxr0t81siXFKzxiiwpRat81kwxvqT1JpGLX/MXFOcCE7xL
         TSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511882; x=1789116682;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=el9C0eC2AOZtIteG0TNFb/RC0Pp+DPvBNH48NZ87dWM=;
        b=IjeY79EEWaVb6h6A8G9EMSNHr/lk4IzwJ5iuGnhl/XV4BUtlUxqRP4q8SkQBGdruxE
         xkinPq0cQognKGtOQZldEQK2bWxTJLlLHRjyLCOtb7A0rcpmQdx+bLrhdShVAFa5m415
         rXx7VvkE48x28LK8nGcmA3r7KDxMMGAxI0GonHFRHavgGztFnJpcxYogP8XjOwj9SGhO
         rSKZ3vccaeTwikoPGfc+ga59ZSNVnekPYf3jWlauf5lcsVf+nna9Q6yjR7VRho4c8O8G
         uwpUO/KbkHZh4Bu5hlkp4QgvfIk8mSv5xhLFte6JT0dSWQZMJttBgYvz5h8VtVZ3ivlA
         Huew==
X-Forwarded-Encrypted: i=1; AKwUvBwvHfcUN+jYSDnpv3eHNRVazdu8gCGJrNGwmEFNTdCIK3Hn2BEd593ICph6JTehjewqnFrYUl+dp9jJmqtQqnc=@vger.kernel.org
X-Gm-Message-State: AFuF++mjMk8sEa5QiXt2UFZ1v/vTcnfGo8bBPW8oAeRQDH00rf3OuoSR
	JcTiHQLvE8YTStjddKtEWh51q4vE+vB+rRHFJnyrwhTVKteVVgl5f1SS85Kj9IhQUqD4D5qHt0E
	nsTwhh1jxHk8s56g9LNbQCb6YqbvZ97E=
X-Gm-Gg: AYBFou22FjR3gWN2Mdk+8yGLJA++5HqQL3YGXqnfUG0mzNJjFAGo2CYmw8w5g0B2rMF
	ZL6IuGA+flUyZC1gazza9B4oSoZzNb3FSWLuB89rtMNb9pI0axERai4TET0ZSPvN08ZqaK/rUZs
	4hHAcRvxBb21FNoUhe79WRJoTMmdRlb913srmXoDy4ZoS1CDnlcYe7UeT3P2VVdeUfvaqpYjXJT
	KFvG/74VUu/MGJS9oqmrG24eZMEqdrTXE4kToMwwAbDc+dd1LrlpFKx2Ba6LnCqSfq14DFdZGTB
	1xOJzr8ukpscQu2xWJz7z1WAAbrhe45BWZ/cnAXsD0DgG33RY7Un/zIajihrj1rxHTQMXLA98hh
	ZoT7sV5yVECv7WvzbR/rmDy8c
X-Received: by 2002:a05:690e:e25:b0:66d:2c09:fb70 with SMTP id
 956f58d0204a3-66fb575c665mr1287497d50.0.1788511882074; Fri, 04 Sep 2026
 01:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904082954.48738-1-enelsonmoore@gmail.com>
In-Reply-To: <20260904082954.48738-1-enelsonmoore@gmail.com>
From: Tigran Aivazian <aivazian.tigran@gmail.com>
Date: Fri, 4 Sep 2026 09:51:10 +0100
X-Gm-Features: AcwNN1US813RpOVK53IyVszIyhGZqjM2-hVqjP58I9fP7PqngduJcqRbNBYYNbU
Message-ID: <CAK+_RL=RHfRLDc=Ldjx1p8KTHSKeELjnBpxEqYjwWX_8ur1hOw@mail.gmail.com>
Subject: Re: [PATCH] bfs: remove the filesystem
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jan Kara <jack@suse.cz>, Jakub Kicinski <kuba@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Hisam Mehboob <hisamshar@gmail.com>, 
	=?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Christian Brauner <brauner@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	David Howells <dhowells@redhat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"Theodore Ts'o" <tytso@mit.edu>, Catalin Iacob <iacobcatalin@gmail.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Andrei Vagin <avagin@gmail.com>, 
	Wei Yang <richard.weiyang@gmail.com>, Bhavik Sachdev <b.sachdev1904@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Wang Yan <wangyan01@kylinos.cn>, 
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Malaya Kumar Rout <malayarout91@gmail.com>, 
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Luis de Bethencourt <luisbg@kernel.org>, 
	Salah Triki <salah.triki@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

Hi Ethan,

On Fri, 4 Sept 2026 at 09:30, Ethan Nelson-Moore <enelsonmoore@gmail.com> wrote:
>
> BFS (not to be confused with BeFS, the BeOS filesystem) is the
> filesystem UnixWare uses for its boot partition. It has extremely
> limited functionality, only supporting contiguous files and no
> subdirectories. Even though the bfs driver is very small and is
> unlikely to cause future maintenance problems, given that the only type
> of data stored on such a partition is likely to be kernels and
> bootloader settings, there is very little reason anyone would want to
> access it from Linux. Other old Unix filesystems (efs, freevxfs) have
> been removed recently, and bfs is highly unlikely to have any users, so
> remove it as well. Retain the UAPI header to be safe.
>

You are right that probably no one would want to use BFS for storing
the actual data today.
But some things have didactical value, rather than mere pragmatic
usage. It is the didactic
value of MINIX (and its limitations wrt making use of the wonderful
capabilities of i386) that
has originally triggered the creation of Linux. But back to BFS: it is
actually used in Steve Pate's
book "Linux Filesystems" (2024, unfinished yet), which is a sequel to
his excellent classic
"UNIX Filesystems" (2003), as an illustration of a particularly simple
filesystem implementation.

I remember when Linus accepted my patch with BFS on 28 October 1999
into 2.3.25 his comment
was: "this appears to be a particularly simple one".

Kind regards,
Tigran
