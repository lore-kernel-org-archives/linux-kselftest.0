Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C0738F623
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 19:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131550; cv=none; b=PUEfoO0lzNRclDxBWwbKjfqYIv36KaFm8BtNz/b+5B9VQfhYjI2COQuo5c6d2Ba5boKncns7ZP/9UFVUPBmSdP9sgBDtnZxNvALyyWALAOZdrfI8LQGDkI4GYuq9vY9UTHUg0oybjiv2UIDtgda8kCFoddpLF9B8LoULXKWQeoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131550; c=relaxed/simple;
	bh=rrpVVM/TXd2iBehI82iGkh/E/IqrUjKfYzsy7IZjmKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iMd9F3qCGzFfYnmJkuzhrg6/l5nQy1bNS8pJYxCLHE5ok5lZK7vE21egMmzQXNFNq07hkOQI6bnf2xMCcW7mV2PfgSZhJZeB1aUziD10Tc/JuD4kcktuJwM42r+s9c4S3tMvX4pF0ZBa5vma2t0/oTYaQh3lTW9DVKFj95/jlJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfH2OEOv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfH2OEOv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so1047681f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 12:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131547; x=1779736347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBC6NBfwX3+M9N5z8/EgZVcnEG4Grml2tle9vPR+gqU=;
        b=PfH2OEOvzDx5nGgrmRx9lVOttYsEwUscougv4FJzo213WBqMC08hhop1Oa3k2GIbJg
         xJll2aMkGIA5MV/L5JVEptnUQgnUPEbdBYPSvwW1hsOTUwl/ML6xwf18yQXBPqHrlJP6
         QOhug6emN1hN7mHl/HAVOoLA8frV/G5d4V+1V0CNdcV/D6/n/Ui+V/hBHv+86DyEAk58
         nij2DyvtIFcunPmjAh0wZuCOMYdHrH2Y4/4Tas7gMGH9HOqwkPBZoSCMgiefNcC6i6Xy
         b2VdUWSwiFl/kzmt00RU7AyDVVtDvSTGI6WujgYE0VJnHT6wGRuKyPmXgkcdF/qVoulO
         8+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131547; x=1779736347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBC6NBfwX3+M9N5z8/EgZVcnEG4Grml2tle9vPR+gqU=;
        b=pFWvAa7aiMzVp1MEv+kaFZRx8ZC9P4CSzr2TPFxZaGklOCYNpB4NFt2JvXhy2MMOFr
         nUYVr/pPPccmorkFQuymH5A338LPqlWwiJABfxneZBZZt8FZ1kl7zc6bGCKxY2WUsI4a
         WjuMWSihMhC4bKB8Fn3ThRmNNESG7ouPInki+UkrDicfUOdurJSp5xDuRg0RbNG9HabO
         zpUnfJU+0BHS3UoEVTF30ZcndJxCymZwp/Q4clFtPOgm5CEIMvdrvAqyaGcdZldnlwZh
         BvXbnUe40ObRajaLAZKmX45uLPgcg9iSOt+/Co4iJKKCzcl4o/T4SY1HXWgpcDJV411U
         NSVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mN1YrWn5sJK3r35bxHykEkelNIs9hUlFmRZrYx3PhOLTuPG0GGML+tzT4ZWtNNJVqBf+cJaE1GEO2XgwMVY0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj7h0h0iq3oCSluVad02d1t4SXGkPYArc9rkngaLMNMmRn3wLd
	6LgTQtvKrz6UZTQOITNUXsCYVs1YAQy3Od65UtaqolsLlAs4nIL82yf1
X-Gm-Gg: Acq92OH3zeVrkZgcAI6AgZO4JcHrP+JIzxR2B+vY1LyUL+9y3ZjRbful8BnGJFvFDon
	GsivyRfSv9FLS+/d3w0doImtS7qfpYrvlEEce1gyqJu0cdoVzPlCpMcJ3mmJPuL8Db5QSfcX6ha
	bXkdHAv1/5EqP5Gl937T0kkk7IEKenOQDbsj3lH1o1mVLoNP3owELWa/HcM7rB3rG3if5FmXUOF
	Gr4mA12CXqLqqQ9TsopMbQniMFYpQGUajburmpmIZ+nukiv1M+DfODjOjgzfBSKbhS98+G4hOPW
	VhCAD6a0NyISMTyVEXA3kz04aVxp1m27CzYciS/9VXYQ8Xxp4+svGmGv09EYa3ltkXVXIRmwB2J
	g4C4L5q4XIFCNWjLYrTJc767H84m36eM+af/vJ9xtIi75Eub2b1DOC/qQx4ZJTEgWBmlHI0q3t5
	yftrFhBJG8/LOIle/fubwHD+HnLbArTlrTepL5zTNUMP2lZEOiBZQ=
X-Received: by 2002:a5d:5885:0:b0:43c:f7e5:817b with SMTP id ffacd0b85a97d-45e5c5cc2b5mr26469781f8f.19.1779131546344;
        Mon, 18 May 2026 12:12:26 -0700 (PDT)
Received: from mshcherba-RedmiBook-16.. ([188.163.115.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm40043167f8f.34.2026.05.18.12.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:12:26 -0700 (PDT)
From: Maksym Shcherba <mshcherba2000@gmail.com>
X-Google-Original-From: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
Subject: [PATCH 5/6] selftests/damon/_damon_sysfs: support update_schemes_quota_goals
Date: Mon, 18 May 2026 22:09:31 +0300
Message-Id: <20260518190932.42270-5-maksym.shcherba@lnu.edu.ua>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
References: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add update_schemes_quota_goals() method to the Kdamond class in
_damon_sysfs.py, which writes 'update_schemes_quota_goals' to the state
file and reads back the current_value of each quota goal.

Assisted-by: Antigravity:Gemini-3.1-Pro
Signed-off-by: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
---
 tools/testing/selftests/damon/_damon_sysfs.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/damon/_damon_sysfs.py b/tools/testing/selftests/damon/_damon_sysfs.py
index 8b12cc048440..27cd94683f6d 100644
--- a/tools/testing/selftests/damon/_damon_sysfs.py
+++ b/tools/testing/selftests/damon/_damon_sysfs.py
@@ -806,6 +806,21 @@ class Kdamond:
                     goal.effective_bytes = int(content)
         return None
 
+    def update_schemes_quota_goals(self):
+        err = write_file(os.path.join(self.sysfs_dir(), 'state'),
+                         'update_schemes_quota_goals')
+        if err is not None:
+            return err
+        for context in self.contexts:
+            for scheme in context.schemes:
+                for goal in scheme.quota.goals:
+                    content, err = read_file(
+                            os.path.join(goal.sysfs_dir(), 'current_value'))
+                    if err is not None:
+                        return err
+                    goal.current_value = int(content)
+        return None
+
     def commit(self):
         nr_contexts_file = os.path.join(self.sysfs_dir(),
                 'contexts', 'nr_contexts')
-- 
2.43.0

