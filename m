Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F331136681E
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769721966; cv=none; b=gExNFGFzDVyPLRRGRHZGusFw1044BzVJorWb3Xg9CuYsp479P4oK3BSKFpeLGOrqC2klmk45i6T616ybuWtz0V8ZYrJ2GQoNHyV5FGs7NXSBD0xuG0PPJQtoKj2HcoS2E+GVkFNwH4YJMv/ueUo17iCCpCVz4eo3hqF5fqDn55k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769721966; c=relaxed/simple;
	bh=Cb9Y8KWzYaZZbnWLogkDgrwZwr7o6CbuJ0QS3Pv10oU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ng1BRC2U6nJWRRUlRThImC+Rj88UM1V7AtWET4GyeAJ1cLFL5Gx+pa4lMIRWsM8iK2D16j2jX9utMAGV+MQ9NcPtlPkIOl/i5xnjL/lNFcDXP+YYMp+P7FEt4/AQuvmuYxvr2x0o+TXVNfCPl63MblPHwYTz72XUvgN6l7JtsZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y1MvxdcS; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y1MvxdcS"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-29f2381ea85so33116895ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 13:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769721962; x=1770326762; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BqEhbyqURPyKNgE6Ne2XGuBboHLh1jY5l9yG8cIgxTg=;
        b=y1MvxdcSHAA2tv1IsyzFmRw57KM/wXj1R1ZdYWaSIzlN1RSmx2DZC/lY7CimLxCBCS
         0vK9SoPcz8XrCFytWn1qKRZdDSdeZ2t6R/Z91DQq/Tpgpc7vbc8pNHwoXbibrUy4JtUd
         XRvw/ZkDVaWbdWDB8xoDlo+9pCWweFVIIAB9EwHkW1wCjh98cRA9acf88FsvMfg6F7V4
         eOA4JZ1Xwkh9rCClweXAF4K4BDHCeLPr55MISxcyzWjgfkaiXXuW4QyrTxZChFoFlnTe
         u8lC+qyEk85GD92i475reauTgqevO+KpL/a6ENkj51ChBaphwulFIdpnaq0r957wLCDr
         8FGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721962; x=1770326762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqEhbyqURPyKNgE6Ne2XGuBboHLh1jY5l9yG8cIgxTg=;
        b=dJ5mdxJQau5zP/JaGMcoGKr8TlcdgH5bKIyhTRiUyYWI67/tYSlibsNfALCjtfkfm3
         HWeIkfgw06Lmd5eMYTSskoh63wA8ks5Qr6oScdbOcs8zcc4K/f7IFaF8D9Mdks3B0lc9
         2HcblW3bjNq+9lF/K9zE+8y4yDzyI5SX0XeE9/YEhGFm7sVvOyGN04EHpnZu7fLOR0FA
         IezDp0VzgVfBDVsGO2nXwKZGJuj+PCUPTFf0dxWu4/wsZ+w+2S8O3ejGN/dGLBJAGaSj
         cfc/LlIXxAwwtoms6G8+Rw6FlgRY0UkV+5n3iHbdGmeTDhFbLLC3FdU6zh8JHDaTOhli
         QOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvTw1g0NTmDQ6CRP5dLcsz0iEo91TjyUywp9LqUGefxWo1/nh+yW4mXH6qpfTAYOu0EE4jJtLImN+Xl1voH+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuAZ6gawd27/ovo0Gcub+uKBsGtQLJGIkUtH5oz7iZCUeIQL06
	Rkc/PJU5S1Oz1az+yd3Qo8lC9I7CvIPO4E070SbN/Bhb+eZVH98FSsk0qbCjOzdoTTgmRTxzOVx
	ZqxBSYEVn9p38XA==
X-Received: from plot3.prod.google.com ([2002:a17:902:8c83:b0:2a7:78b9:f962])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:bd03:b0:2a7:a9b8:ebb0 with SMTP id d9443c01a7336-2a8d96a7ff3mr3875585ad.19.1769721962280;
 Thu, 29 Jan 2026 13:26:02 -0800 (PST)
Date: Thu, 29 Jan 2026 21:25:02 +0000
In-Reply-To: <20260129212510.967611-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260129212510.967611-16-dmatlack@google.com>
Subject: [PATCH v2 15/22] vfio: selftests: Add Makefile support for TEST_GEN_PROGS_EXTENDED
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

Add Makefile support for TEST_GEN_PROGS_EXTENDED targets. These tests
are not run by default.

TEST_GEN_PROGS_EXTENDED will be used for Live Update selftests in
subsequent commits. These selftests must be run manually because they
require the user/runner to perform additional actions, such as kexec,
during the test.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/vfio/Makefile | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 1e50998529fd..f9c040094d4a 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -23,12 +23,15 @@ LDFLAGS += -pthread
 LIBS_O := $(LIBVFIO_O)
 LIBS_O += $(LIBLIVEUPDATE_O)
 
-$(TEST_GEN_PROGS): %: %.o $(LIBS_O)
+$(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED): %: %.o $(LIBS_O)
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $< $(LIBS_O) $(LDLIBS) -o $@
 
-TEST_GEN_PROGS_O = $(patsubst %, %.o, $(TEST_GEN_PROGS))
-TEST_DEP_FILES := $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O))
+TESTS_O := $(patsubst %, %.o, $(TEST_GEN_PROGS))
+TESTS_O += $(patsubst %, %.o, $(TEST_GEN_PROGS_EXTENDED))
+
+TEST_DEP_FILES := $(patsubst %.o, %.d, $(TESTS_O))
 TEST_DEP_FILES += $(patsubst %.o, %.d, $(LIBS_O))
 -include $(TEST_DEP_FILES)
 
-EXTRA_CLEAN += $(TEST_GEN_PROGS_O) $(TEST_DEP_FILES)
+EXTRA_CLEAN += $(TESTS_O)
+EXTRA_CLEAN += $(TEST_DEP_FILES)
-- 
2.53.0.rc1.225.gd81095ad13-goog

