Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345B335C1B7
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 21:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769721941; cv=none; b=pD4Ygwy1EtgZGmO4UJkp+OugpR0oR6P493s5xwxMsk0uZ1Err/98DMjX8I+gMS6AUDcyvf6UjW8bxPklHK6C2Xtqg2tEAhQNYLvs71QM2ELLTQsD6D0MqFU8iRBz6ZaAdirZtvn96rcXWcU+Gu3wywjfA/kIch7j77Qyp0ESm/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769721941; c=relaxed/simple;
	bh=pGh11QoBfatNNPcD3UbRdXhxdT0MMITx2WqEtn8eFss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ex8vHOG4KAEYjx7/D3QJ6QtYSALkdVpwytE/SC5HgXFg8KocQDswG8oyzkbBHkTkgpOc/+tZRoBWS4RoI4n72nrVDLpL8K+emiGAKmYlrgu3hSI7s4JxEq0X4gCynIIfleND2U0hLi0CXlKuJWN7XHhABY1xxaImxD17JzeeP1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YgClsBSQ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YgClsBSQ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso2888699a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 13:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769721939; x=1770326739; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iXsfpp7fYjSPi1nIw2ScrDnrjqTlWGi7ZArDWIRjDgk=;
        b=YgClsBSQkemOJVm7JMV99ev6GYocZTi+wpSdSxrIQAl42Bql7Vr4oGTqoEtm0Hz9vX
         24FOanK/YWsgGM16o/756RCi/TOKqOzj6j+/XBtzZ6F5BPmRulnQtrHlb2JCAgnW64xI
         wNDMI/jZXzuZhvw5/SCsFa8VhoGxUbJKTZNI+6kQ30ZrMLTCUyccCV5JxCzWHXbKh3JW
         Q2FnBxQj9+z5NNXKrQFB9QPKJiGtxr5vgr5VXI9hJjIvAQXV7wmRW9xO9nrwSm3foyaO
         u23daigvanFsWEXNf1FeMaLkRRSNf4xQ68YAVvzmWfN9o6GimsOztC2hSdEGDi2TCgLu
         3L6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721939; x=1770326739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iXsfpp7fYjSPi1nIw2ScrDnrjqTlWGi7ZArDWIRjDgk=;
        b=Ipbag/yfkfTNqlXvorTdV21f/8myuHQ9r/E7uQuECM/N3e2ttpBf3BAV3RB07mUGZn
         nRpoTbjek+ZyNqeOu9y4wHNe75IXv0o3tZuzIix/COID7qwPxf3Nd+2RHHSh+XVBA+WS
         ZlY9sLCv6Pk3dCQyYg9hLAJEuNB8SMiLAcrUko9pAJwWeB5bj9vfMnT52TNM+W4ADwKn
         QBqiwaMYIfzPZ/e5hXEVsiffqsXB+cKEfrZEKuBVtPBoOBqQFrH/rHRZqvanNvEggZXq
         lfsjKL+ZYDwn3IL0ck1a4T+dF0JgzHnCbkSvXiljzcC7ipU4Xvhl9ndH2Vv8aKnFyhxZ
         wgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz2MyBzwe61N2OsAWqUw5vxudWULQoWHPDudQ4jWbqZBRAAxwHAgqAo9fERcx/k3kL03XNfeXwOjPCct+Vzlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH1xQIpeSxtt6MPuQNcH8mK8CQYUrLBIqZFWCL2gbQTJO8lR4H
	me7sdYnUCbyc/g6nuZT7CO81YGRixD0b+hru5np0rNHYoAgY+NyTY6i389ijIvD6IBViYzwgmFg
	WCfuYpb5c9/Bi6Q==
X-Received: from pjyu17.prod.google.com ([2002:a17:90a:e011:b0:353:454:939c])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:17c9:b0:353:356c:6840 with SMTP id 98e67ed59e1d1-3543b31688fmr768863a91.14.1769721939368;
 Thu, 29 Jan 2026 13:25:39 -0800 (PST)
Date: Thu, 29 Jan 2026 21:24:48 +0000
In-Reply-To: <20260129212510.967611-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260129212510.967611-2-dmatlack@google.com>
Subject: [PATCH v2 01/22] liveupdate: Export symbols needed by modules
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	"=?UTF-8?q?Micha=C5=82=20Winiarski?=" <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Tomita Moeko <tomitamoeko@gmail.com>, 
	Vipin Sharma <vipinsh@google.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Export liveupdate_enabled(), liveupdate_register_file_handler(), and
liveupdate_unregister_file_handler(). All of these will be used by
vfio-pci in a subsequent commit, which can be built as a module.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 kernel/liveupdate/luo_core.c | 1 +
 kernel/liveupdate/luo_file.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index dda7bb57d421..59d7793d9444 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -255,6 +255,7 @@ bool liveupdate_enabled(void)
 {
 	return luo_global.enabled;
 }
+EXPORT_SYMBOL_GPL(liveupdate_enabled);
 
 /**
  * DOC: LUO ioctl Interface
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 35d2a8b1a0df..32759e846bc9 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -872,6 +872,7 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
 	luo_session_resume();
 	return err;
 }
+EXPORT_SYMBOL_GPL(liveupdate_register_file_handler);
 
 /**
  * liveupdate_unregister_file_handler - Unregister a liveupdate file handler
@@ -917,3 +918,4 @@ int liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
 	liveupdate_test_register(fh);
 	return err;
 }
+EXPORT_SYMBOL_GPL(liveupdate_unregister_file_handler);
-- 
2.53.0.rc1.225.gd81095ad13-goog

