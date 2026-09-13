Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988C1283FDC
	for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 03:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789270358; cv=none; b=jCt00HfBImrUQAbxdOK9Eg+vr885hpy+DhkZYC5UHXreBHbmBP8bZSKlBc6/ORn5jYa/n+sRvc2fLriUKE2cWsurkszjfQuC1Bz8OPrkxUnPrrcHXxijmlm+FAOZ0UbdYBJrj5MO4OSxO/+4XkVnI9ZVYbwDsbZeZ2EFq49nrn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789270358; c=relaxed/simple;
	bh=qynwl3yegS3zN7wkeohcoAEZv4LlKGQdHuntDJ7koXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r99he832gbXlN3L/lSVRn9oYk6xdNHxf2BJ20W/ntkESHiACLkMNo+9HaS2f+B67IvfgYmj98k01lseQWsyMveJd1LKG4sNNBhqGzZ7ncP4OeghrA4upc1rtqg+VjEIVRt+q7Q8i6VeUykj/Mk+pvM2zBYdSWZLjfBQq6U30y4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+xqe64m; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+xqe64m"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a30521ef15so5871091fa.0
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 20:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789270354; x=1789875154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjaL8mti/vahJlLkdMnZQO8Ei/dHHViRxDz/+EAVwR4=;
        b=K+xqe64mRgpbpxbwP50a8Gjn9ttToXXtZlpjd0dHUzX4hfIf/lDYCkhhnDVPXq+KFz
         7o2+pmeKCd6hsbS6GHLrWGhySFNxYgHXhSnTV9gCb9VuOx8dJRt3kjBzxZ6hoZrhPZMB
         OYNsqyK6F0BuX9KM4MXBJwwWCW1/i30zypBbJ4QHrvg8yhrrEGZPF7LrhFMuAzAr0sAK
         1H/WPP6HZYHQa2lchsZB/laJsrthtdbJT7hu6AbhkNiLbHWFsk8e2D9vAh3x2Nv3qsKR
         zkS5AnByw75wLEg4xhoZ6b3VFRowNutb6Ws6/gTFXgLvoS8TjyXskItoEAi5XlCRhVnm
         bUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789270354; x=1789875154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjaL8mti/vahJlLkdMnZQO8Ei/dHHViRxDz/+EAVwR4=;
        b=kHWPupsDV5qzIDJbSJV0ke8e6fP4k+of+87bT9MeXrkS3/cthb5mrdVHMNGq0P3IUQ
         XEO76QBKzSRagEuKElrZISBt+sE73MBYY8reKPZBMIUBgxzGXyJw2HnChRBPjbumbDYE
         XplqZ5lXg71CxCOR74PuPYOmJBEx1WttFOq5FqoScwRCnvW3hwRFG5nWrMrYORlIo4ET
         W/C6rhcuBfXcZpEBMg5uNZk8pKrShEPWq4pyumDimiGMNVwurrH4srTsJJBRRmJHtkNM
         bbM6qrDGCc0I7gF/NINMmTEogMXs30kXc178z40jppvbxmXwiZQCikSq5qEaPQ8pi4eK
         8Dkg==
X-Forwarded-Encrypted: i=1; AKwUvByX1aylsoio4nYJ8W48XkPyLop9iWpngOxk4Dqp1bcHXHNXcdgaM+IUJ+4Y+bW3DKgecMcz7m3ay8zeMOk8Vok=@vger.kernel.org
X-Gm-Message-State: AFuF++l0fZr4S/drp9FaaMKy+iCo9M6m6fPxJbwEv8/eFACuUGYlB/B2
	XyYZchs3aUwiJRla9zQje3gvZ9MEFb+2+ImRzXoDLgGhi6Wthe6zYhzg
X-Gm-Gg: AYBFou1TeKC1s0ucsg1tSug0Eog6YVGpYmB6mjBrlVUuFIU1jb7mSUqYFuyJPB//l4k
	6yIcZN0GECzr1ETnoXV5hWf5R9y7let2okcbTuqF+c+dMn8g72FgDpeKYpvdctaT+9JriBPyRwc
	2PVxOgiz36S1AqK7Sz+enJpPy13Tsc2PzdAAZ3oW8RNUJ3D1NXHsDdDe+QA6ZSJI2y2llGXP/Xn
	9F2pJuCdLPVUsqrHhZSenIWpzJSbSAJbCDPKwrc94whjKJ6Zofi3hgzRZAGS71bOwqAQbjJq/TY
	a6zRkDp6B4xwxZAoD8v57h8yjGqMW07X7w8/Qy0YNHgxgn8e9pvuLp1X+mialCeheTSuPMvS4Gs
	lhEfGd2sjVl/i0UTCOp8F4DTYb03lDiiD8vWNUS6pH16nWtDsT72BliRXJVLDbpvBN/yxiWObzN
	NMcEBEeJ+XfASN83eZ8QZoRYh3SGSbcQy1t7AZcBqp1pG+fmAgO/9vetWZcTJFZgHa6jXR7lRgD
	md1geJo6CGjNQzx+aBgIAmMjmAwkQZg3GjOs8LuRJ1/
X-Received: by 2002:a05:651c:144c:b0:3a5:ba1e:8b05 with SMTP id 38308e7fff4ca-3a5ba1e8dfamr2827451fa.1.1789270354310;
        Sat, 12 Sep 2026 20:32:34 -0700 (PDT)
Received: from dau-home-pc.. ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33a1cd1sm17024041fa.42.2026.09.12.20.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 20:32:33 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 03/11] selftests: net: add a test for the tunnel RX drop reasons
Date: Sun, 13 Sep 2026 06:31:51 +0300
Message-ID: <20260913033213.873609-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260902184549.63f37d04@kernel.org>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com> <20260831215137.549324-4-littlesmilingcloud@gmail.com> <20260902184549.63f37d04@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 18:45:49 -0700 Jakub Kicinski wrote:
> Completely unclear to me what the value of the tests you're adding is.
> Please look judiciously at the generated code

Dropped all three selftest patches in v2.

What they did: bring up two namespaces joined by veth, build a tunnel
pair that disagrees in one specific way, send traffic and read the
reason back from the skb:kfree_skb tracepoint.  It is how I check that
each path I convert reports what its commit message claims, and it is
what caught six paths in an earlier revision of this series that still
freed the skb with SKB_NOT_DROPPED_YET.  That value is in writing the
series, though, and does not by itself justify 346 lines in
selftests/net.

If such a test is wanted at all, I would rather come back to it
separately, once the conversion has landed, and in a smaller form:

 - perf record -e skb:kfree_skb and perf script, the way
   openvswitch.sh already does it, instead of driving a trace instance
   by hand;
 - only the cases that are not evident from reading the code: a peer
   that reboots and restarts its sequence number, two ends configured
   with different options, plus a control case where nothing is
   dropped;
 - every case tied to the function the drop has to come from, so that
   the same reason reported by unrelated code cannot make it pass.

Is that worth having, or do you consider drop reason coverage out of
scope for selftests/net?
