Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F0F3403E4
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 04:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783829333; cv=none; b=cg3+GtPytFVgsogfP6NqD4IYFKK3VzQhQqFAcD8xIHF67m50k2we6eSGd7dvqWIsaLzQ6gX50+iZXOzgaCns6HGXzFqovZvSxaAE4WHBhesUOKWZ+RjWfpkLStSN4uTHyL6L2186NXyGiELrF6O83daYGB8zCvNLk+Mq2J+xKNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783829333; c=relaxed/simple;
	bh=1q6mbB/bkD8j4HZw6McdfhEuY8vqwQWBAE158sj4Y8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFu3nZsw9ncoOOmUI3rqTTHaJpCfNu3liwNCwBM42qRDVlVxpcuU6IGMWukvctNbHyUts+KVPY7SJnOruHf8sAol9q8tXtXs6MmuUV0SdTXN0nU0qh9apo4zb9cdpfz2i0xyk/GuDU25Wr81/Ttq2rJtzAk9/xlkRjhnu59OrnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbokcfpl; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbokcfpl"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so699466a91.0
        for <linux-kselftest@vger.kernel.org>; Sat, 11 Jul 2026 21:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783829332; x=1784434132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vSs3PpxD7fzzGCyEVeEQofuGfZwATqltGOSkAKOV+Y=;
        b=cbokcfpllFKwZICTa8uyEtG3gK/7FawCR3BdoMCN2eYnV/UaEACwX8YYUUTY937kqu
         XrhvbfA812Px1NShMdXdMLykuPbxRC5P+2PoPv3ARp/vRKOFfCsUPO71qaLla4K85qfO
         ztngsdEEwdwI/6rv+0V2rsNJiSerwBjniugxklJfOUOAXlFU04Zch8ec5bzDlUImavL3
         Id7FFDrNo72KepusQwMZi7n2BOfd/7MWmiPrCIH09//1ijwcKdTqEj093c8nw4Rw8EKl
         zjzAQu36pZUYE9gZQ+3xDntkT/jY0pnlf+I4CD2rhkkarpitFXpDnOZcUQt1p+r15IRj
         wyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783829332; x=1784434132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vSs3PpxD7fzzGCyEVeEQofuGfZwATqltGOSkAKOV+Y=;
        b=lS6do/6o8OtsHWCddjaG2qb/Kq6+eIZBN7IdaW3+U3ae2v4lsDPYUqMqvouFGGSqOa
         T9h5IlvnWRQmHS2qaX7CPwjqvuhA+HZH0oE05kZrqh11kBDY64wQAUHu63cc/v4lUXpB
         0SwdJ5cavC8xVzeScbJA+x3dgqXlzvVDpz5WVUmSJ9l2Gq9E6j9cJ0fzf/nQOQVSUJD+
         1I1nLQFA6ZCCHf74VSeYXP5FI+5FUEeYZZhy7q4VXKiUu2/oUeZ20qYMtuvXs3cGvtpr
         NEQwBZvUk1+51wkNjL8Q19NOLE8mvDvjDj23kb5EnAL3U9UJOv73yexLl3eV3GyyAczJ
         UMWw==
X-Forwarded-Encrypted: i=1; AHgh+Rq28BgK9037p5z4wTAPCyvhuhVw8vmQDYZ1aP1y+keJ8AD7S9chwUCMx0d4dHTWjY/aEf0yOF+CA+YmC+Sady8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv6ZjFIvFi6Kk846wMtvse0Qx7Ljn5iNAsWnkzGv6A5Cfro4+E
	qxD1nQTK1TZzTztze7efVkkBL7PEh4oMl4TWe2P470DLDg9UKFjU8ROjnP9powFk
X-Gm-Gg: AfdE7cn2BIKOX3dvtlZ4Z1MJGgJpovhIs31bYIw+u2N3YvOz6UrAlMcEA8RpIGo8SVq
	7sGDT5qmKmmQMQRec8YUvoHpUg926Ci5hQKPmhhhtDi6I/riiV+IUm1GwuWgvQ7YdvZqoUK8oqh
	Bh0ZF58nXbu/rj+3gymzBgDeF1F9tf+b0BrOCzFS2Zo1f6gESjRpEXl9uUm826OfteFpiLtONqH
	wNlGY2Mhe+tnaqA2+NeQfyNYuvrA++nhh6hceRfiSnQOC50XZnrnmLY1sa7R5Mb9trPogc3X7F3
	VS+5Btkm+ZP4RgTnwMG39SDmq1Mlr0Sdh72OIAPbKikGMA+tOsEep3HQXNaUzkzKjkNsAkIBj5D
	vuIHE6nI49Hu+RHaPd9tnln1g+JL03y9wIZUErz/VPJQrNSB8EeDsyOfPsDuTZLGmPGPz1Vwfy+
	WxzE0U5IhgGU2ShJPvoHMWUfEc42s=
X-Received: by 2002:a17:90a:e7c4:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-38deaec5594mr631416a91.11.1783829331759;
        Sat, 11 Jul 2026 21:08:51 -0700 (PDT)
Received: from [127.0.0.2] ([98.35.8.117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm56808928eec.10.2026.07.11.21.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 21:08:51 -0700 (PDT)
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Date: Sat, 11 Jul 2026 21:08:14 -0700
Subject: [PATCH v2 1/5] exec: stash a bpf-selected interpreter in struct
 linux_binprm
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-binfmt-misc-bpf-v2-v2-1-d6591ceaf207@gmail.com>
References: <20260711-binfmt-misc-bpf-v2-v2-0-d6591ceaf207@gmail.com>
In-Reply-To: <20260711-binfmt-misc-bpf-v2-v2-0-d6591ceaf207@gmail.com>
To: Christian Brauner <brauner@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>, Kees Cook <kees@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Jonathan Corbet <corbet@lwn.net>, Jann Horn <jannh@google.com>, 
 John Ericson <mail@johnericson.me>, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Farid Zakaria <farid.m.zakaria@gmail.com>
X-Mailer: b4 0.14.3

From: Christian Brauner <brauner@kernel.org>

The upcoming bpf-backed binfmt_misc handlers select the interpreter for
a binary programmatically at exec time. The selection runs before
load_misc_binary() has copied the binary path from bprm->interp into
the argument vector, so the selecting program cannot go through
bprm_change_interp() directly without clobbering argv[1].

Stage the selected path in the bprm instead. The bprm is exclusively
owned by the task doing the exec so no synchronization is needed. The
consumer frees and clears the field once the exec attempt that set it
is finished; free_bprm() covers all error paths.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/exec.c               | 1 +
 include/linux/binfmts.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fs/exec.c b/fs/exec.c
index b92fe7db1..7c9e28f54 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1418,6 +1418,7 @@ static void free_bprm(struct linux_binprm *bprm)
 	/* If a binfmt changed the interp, free it. */
 	if (bprm->interp != bprm->filename)
 		kfree(bprm->interp);
+	kfree(bprm->bpf_interp);
 	kfree(bprm->fdpath);
 	kfree(bprm);
 }
diff --git a/include/linux/binfmts.h b/include/linux/binfmts.h
index 7e7333b7b..1dbec6905 100644
--- a/include/linux/binfmts.h
+++ b/include/linux/binfmts.h
@@ -65,6 +65,7 @@ struct linux_binprm {
 				   of the time same as filename, but could be
 				   different for binfmt_{misc,script} */
 	const char *fdpath;	/* generated filename for execveat */
+	const char *bpf_interp;	/* interpreter selected by a bpf handler */
 	unsigned interp_flags;
 	int execfd;		/* File descriptor of the executable */
 	unsigned long exec;

-- 
2.51.2

