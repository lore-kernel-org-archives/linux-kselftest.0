Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699873A6EE1
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 20:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774557841; cv=pass; b=oNK5vgdsaKNERJTkoJnk7ZAgUqO/pUVCQHHFQBILxIjkCrnAny5PInBVTPq4chcXkG76qkAmRj++EhZGzNBotTSxfia/8vbZsVEkBCcOSuNLRY4vruKx85BPGl+RoW2HXqkcxpx9uRT3SOm1qqL3rl9t64KEnxTBI+p3BiBofZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774557841; c=relaxed/simple;
	bh=PeaSOVbGjvcbPrM1ej8GhDm0pQojiKvmqm8K/+z+B5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRfdsfWqkKPeoakbfWPJUkSkNHVIqSXApQm9BIakK79J1D1QiXGzvsWeMNlzhUoUqFK/yc7TAd6Tk0htopMS97XrKXwSP4DqP5oNmSLZo8tgcdGdqhiGFiamHLFdzOyqSVGTr6ZR+zwlKGe1cHuNMg/9lTgGYNZ6ImIZ6hJGh0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=piX9Xtl3; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="piX9Xtl3"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so1639849e87.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 13:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774557838; cv=none;
        d=google.com; s=arc-20240605;
        b=FzbUSJHj/wpyY21DgQmKe8x7pAfkca+EFf4KQnWbY2Nz2c7LB1gXD/bb1Lc/NCGOtw
         PX21seLW51jUy882kGlVjaKAn4UJXv0yN6im+MMzkfpdlPzIjEZJzPAGKbONwxYdzMuV
         2812iGYHu4ZE/gn5byzBmrSktn70wpDP96xv4pKVoGAlDz/MHxgQs1Ur30J3N0qx+ZoS
         UPLWobJ+LOmA3oPlDf0Hkq1OrQ2nqMCMTyeWFHKIez+SXFv+6QEptUolzYZETAxeKijH
         zefxqd5ZCrUhXCIt+vWISJW+yKU0l8U40XEjAEFaboj12Gf4EOYnVDbI32oJfMbj9/IK
         g1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CnD4wGwZvJQvR/a6rbd+FFqGbZMJuBdhvv8TVCrH3ik=;
        fh=o57e8bEgrpQlY6F6xywD5VM1jbPIuSz28YgFSwy5X5A=;
        b=khccvpOZhKQbcyYGZeHV/CyyCmuc3XY+G136RdqebOzfsnaFWymq60wNz+7jPXpxqi
         Ah1IxTIP1pw7kjTRl3G4djNwqlAwEPBQ+cpYhjg0toShkY8zTLQC943J/u31HHUKMfUY
         OpQ4raBzwS2vH6grOwy4Mq6gS/O/Hga5YxllFpGk+0zYFBjvVTmzDyC50wFL6YRza4yq
         5rqfgMlVGE1rv00b90f4ZXWQIETVFXoQB3oBNgQ6Vqqw6C1XFrMVQjYYZcbB8uZw83Ux
         JucZgLSkCJBdNw+mJ0AIUHCKlBVWKy0zvTjOV2YsOH1TFLbRcU550aPib3WYOQigs/dP
         BYKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774557838; x=1775162638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnD4wGwZvJQvR/a6rbd+FFqGbZMJuBdhvv8TVCrH3ik=;
        b=piX9Xtl3iaNv8uRfxNguwwZybMuQycDIDPJDH0KJMJLN8uO4MO9qljp+6Um2fxBy0W
         DvbbxR72etHfe2JSvVkW43pq0jujJGTwdK6ZIn9fYJxI0JEyQIpzWNhFE+UPxqAXCFOx
         muZ4ven/Q02Rnfe0TNN5n2BfIDJfc0qu7dlulBOX+4IMwpRmLZHE4SKf/IolDO2ZGwry
         SzjXwCdA4gxJYubVTk+stqy1YCCmBeW+ZAgNmOUYeO3y2mXlphgmGYGEPOoUqpKw5HpR
         Ie5nuyrjnlTAW7NHJdpmZrOjV/IfjDvFPmsknTUTQ/VJT8MbysYMuKN1aoCVotxvyED7
         uSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774557838; x=1775162638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CnD4wGwZvJQvR/a6rbd+FFqGbZMJuBdhvv8TVCrH3ik=;
        b=sAqExvEAnCkh7bo2wMMGO3dAzPWHHL7bVmtXOUPnMtO5wJjprdMx2VFgOxax0niGN9
         UVcP9pCkyowYtcAMyNGBGAeIioWB1KUB457NMXOhUh5StlftHP0smHpbhGKLAy+z9npl
         7yDSAgNa6Sx7XvQrNTKiM/us2GqpMk0As1C7JdQqKMhjhL9qX7Q4sl9FmdYrbrOxV8y3
         9RDyjRVXEvSMuEf8JJAlAbNyzU7qTZHkO7VAW7kRRM6U2aFHdEQH71Q95VPP2FDMCoY4
         2lPa5fs5U3m3fmRDqexbkiGI9qPasC7VRBP8t/FaafibiCETaRJ4VANM6Yny3Skxm+57
         5bmg==
X-Forwarded-Encrypted: i=1; AJvYcCXV8P3/2eVBl66F1G34Df8BbFylXEae/2QCTsPZLn0Q8b8VivJwCSFLyBxkbglhX0QolTblDWWhn2kaH8H9npM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhwFPMvi302uIsbDdqP6zt0Q7Le5T3g18CUum9KrxunaUODT2B
	FWD4IBlQQscanhSt3wR/dNRP18Qi+nZGCT0qhJZeS+3FfYIodcRFt08iBE5dDJDZB/RKbfx6pYW
	/ua0KChVAqh1FEzs74wRlMwC2ygR7F7v2yq0ycRGq
X-Gm-Gg: ATEYQzzcxJRSOYyKnCTf9fC3/m3f9TFzjluGua+GIKpJCYXJXsTiGDayIoUfc5m9ACS
	Z7gvEb6Z6jFGsdmK9HJWq4TypYPnl0/5eunn7moY+pI+mUosOPhmvAKyls6/QO84gyXHRea97BE
	ijNQ2uSp3+raOWBWIVX32gJXhomMhDCzqcHYFUQSR+LRXUbXsueQJp5+X+KEl+njEEhNjJStTJZ
	DPtsurjwQUvTuXrS+QSqu+Q/2qI4++SUNmywztaWzjsEZH3U0d3s7ZG9Ztj3Que1TXnemzB/RGD
	YQPvy7LO
X-Received: by 2002:a05:6512:10c6:b0:5a2:a5e0:2da2 with SMTP id
 2adb3069b0e04-5a2a5e02ec7mr1094413e87.8.1774557837156; Thu, 26 Mar 2026
 13:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com>
In-Reply-To: <20260323235817.1960573-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 26 Mar 2026 13:43:29 -0700
X-Gm-Features: AQROBzDv95n65Jfr7km6DKOoUBuRrbrSOHrGu-gele9pXf1C5O1laHd_UCbivjU
Message-ID: <CALzav=f4--Kp5vXz5zrxZR3WVsa9T1GF4NFFtuf_Q5ESMHmWwQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] vfio/pci: Base Live Update support for VFIO
 device files
To: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Li RongQing <lirongqing@baidu.com>, 
	Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 4:58=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> This series can be found on GitHub:
>
>   https://github.com/dmatlack/linux/tree/liveupdate/vfio/cdev/v3
>
> This series adds the base support to preserve a VFIO device file across
> a Live Update. "Base support" means that this allows userspace to
> safely preserve a VFIO device file with LIVEUPDATE_SESSION_PRESERVE_FD
> and retrieve it with  LIVEUPDATE_SESSION_RETRIEVE_FD, but the device
> itself is not preserved in a fully running state across Live Update.

Apologies for the large number of people who got added to the CC list
on this version of the patchset. The changes to
Documentation/admin-guide/kernel-parameters.txt in patch 4 caused
scripts/get_maintainer.pl to CC a number of additional people due to
--git-fallback. I'll fix that in the next version.
