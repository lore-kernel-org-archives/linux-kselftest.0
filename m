Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96162D3A7C
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 03:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782705131; cv=none; b=mdSMENW6rNFYmta7OAsP0E1fo54npg5efrZx34oFrVH0HX+Hyh7S5FAzdW6rPWzaLqqS5fxC8WU53c+K0sU4d0KAYu+jf/rh6iTTlaAyRdWC+OMxBM2BfqeYvIIdVEW5kBOtBHkpTOaicJgHQfjinWiUX2/9WNx+/svcqky/VFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782705131; c=relaxed/simple;
	bh=rKwV/LEb84Jbzy4FMOdOPzyN681E0QsMrJAiRwW6t9A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tLQvZIbq0NVNy5JX5pUxhNiN4QTHmNpHq3NpTQdKePOQScfYqnp0GYrnANKjyu3mo92PoJqf4jmhPH/IXnIsBKRO9y2kHk8201XF1xKg39DptRR8JqltMt1CgUdS0a1AeclQ4zAgWVVgs+QgYPcYwwXKLWMS63uZKGs9zvgo8C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=LaCVwwEY; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=icTef26W; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="LaCVwwEY";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="icTef26W"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=LaCVwwEY2Xo69tUZh1jbbC7MxcUrnUfxLn2+jE/3jnxZXNyiLnv0dlTJaEB8Lo6PhYA3a2Yu8crVUXTdszD0CXg+VeZ9wg4BVRxGQWqPLK8eYNAEwwAf8Ur5tlJ+sRqZE8T0E2tLSCzW0tx9MCykU9FSTvw5B50jcPkB7bA75/hybeIMg2jN7rs2Mn0ThOmdQPwZ5wD55dVGsrkl1erNHm/tn7mL6k48E7GXInTi3UlkwYBdlbzHCGZF2bulZoFb/qzn/ES2iUdNHGrZ2kg1N1XNaBJ9XkzHjkyVrVbKvfmop9IOjXtd29yb3RHtwqcNJe7T9YnnG4mD5dsU5QI73A==; s=purelymail2; d=nikableh.moe; v=1; bh=rKwV/LEb84Jbzy4FMOdOPzyN681E0QsMrJAiRwW6t9A=; h=Received:From:Subject:Date:To;
DKIM-Signature: a=rsa-sha256; b=icTef26W2MoLCN2Bs6DEEzEl0MDSiuvrYQ+uYCl0UB9YwXg6W5PaF8iyhk69XV8APpvhAFGK0e4g/zZFd+BhxrW+29BWkXMYSUNZEKiaMDB1b/VhfculkFQQDkIv/OXYXG6Q4ofbpRSWdMZeOcMYbdfE94/lKYvgkPfTDiO00gvP3V6w0PQul5ZBAqcgCzvLgJF/mqlrvvP0w5DQ0YxHdNhzI4GUfW+NsJWjgErHEgc+QomBCD+oPikJozqrFLj3iIKtYGg2NI+NpdQ0EMjUC2sBKVpvCkIhq7hgjig0RRNxmM9Z1mqaE03b+hy0Beq2/zguS5itZR64iCOLOrYQMQ==; s=purelymail2; d=purelymail.com; v=1; bh=rKwV/LEb84Jbzy4FMOdOPzyN681E0QsMrJAiRwW6t9A=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: linux-kselftest@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1530718721;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 29 Jun 2026 03:51:34 +0000 (UTC)
From: Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH 0/2] rust: kernel: add cfg_select! and use it for
 config-based selection
Date: Mon, 29 Jun 2026 05:51:05 +0200
Message-Id: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKnrQWoC/x3M0QpAMBiG4VvRf2w1M4pbkcT2jT9Cm6SWe7ccP
 gfvGynAMwK1WSSPmwMfe0KRZ2SWcZ8h2CaTkqqWtWrENJr1PPwljJuHgA3mEpV2FUorSw1LqTw
 9HD//tevf9wMofOJKZQAAAA==
X-Change-ID: 20260629-backport-cfg_select-54f5e3d034ed
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Yury Norov <yury.norov@gmail.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kselftest@vger.kernel.org, Nika Krasnova <nika@nikableh.moe>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535; i=nika@nikableh.moe;
 h=from:subject:message-id; bh=rKwV/LEb84Jbzy4FMOdOPzyN681E0QsMrJAiRwW6t9A=;
 b=owJ4nJvAy8zAJTZhNXuihihnHuNptSSGLMfXBzOU+dRjHbL5lriyMemEzuKSOzEhsE4hr6BMp
 ngbR4moXkcpC4MYF4OsmCJLWZpWSGXb90s+psvzYeawMoEMYeDiFICJhF1kZDg0fevFnbdU5c03
 xOnpBHjt3H/aJ9MwuV7h/Jz3bGahwisY/id//LS4J+XB85UnDqhuytyoOI950nfBeXe8UkRCmX+
 kcXABAEXCP9Y=
X-Developer-Key: i=nika@nikableh.moe; a=openpgp;
 fpr=D6F05A682D63EA3D6C771A8F4448A49D9CF79732

Conditional compilation in the kernel's Rust code is expressed with
paired #[cfg(CONFIG_FOO)] / #[cfg(not(CONFIG_FOO))] attributes when
selecting between two or more implementations of an item. This is
verbose and easy to get out of sync.

The standard library gained core::cfg_select! for exactly this (stable
since Rust 1.95.0): one macro that emits the first arm whose cfg
predicate holds. The kernel's MSRV is 1.85.0, so it is not yet
available.

Patch 1 adds a macro_rules! backport under the same name and arm syntax,
so call sites can be written today and switch to core::cfg_select!
unchanged once the MSRV reaches 1.95.0. Patch 2 converts the existing
paired #[cfg] selections in the kernel crate to it.

One selection is deliberately left as #[cfg]: a #[macro_export]
macro_rules! referred to by an absolute path ($crate::) cannot be
wrapped in cfg_select! (rust-lang/rust#52234); see patch 2 for details.

Testing:
 - KUnit: rust_kernel_cfg 14/14, rust_doctests_kernel 322/322 (x86_64).
 - clippy (CLIPPY=1) clean; rustfmt clean; checkpatch --strict: no
   errors (only the benign new-file MAINTAINERS warning).
 - Built x86_64 with CONFIG_DEBUG_FS=y and =n to cover both debugfs arms.
 - Other arches / CONFIG_64BIT=n arms not built locally; relying on CI.

Link: https://github.com/Rust-for-Linux/linux/issues/1183
Signed-off-by: Nika Krasnova <nika@nikableh.moe>
---
Nika Krasnova (2):
      rust: kernel: add cfg_select! backport for config-based selection
      rust: kernel: migrate to cfg_select! for config-based selection

 rust/kernel/cfg.rs                   | 297 +++++++++++++++++++++++++++++++++++
 rust/kernel/cpu.rs                   |  21 +--
 rust/kernel/cpumask.rs               |  42 ++---
 rust/kernel/debugfs.rs               | 145 +++++++++--------
 rust/kernel/driver.rs                |  44 +++---
 rust/kernel/drm/device.rs            |  53 ++++---
 rust/kernel/error.rs                 |  47 +++---
 rust/kernel/kunit.rs                 |  54 ++++---
 rust/kernel/lib.rs                   |  78 ++++-----
 rust/kernel/mm.rs                    |  36 +++--
 rust/kernel/prelude.rs               |   1 +
 rust/kernel/sync/atomic.rs           |  54 ++++---
 rust/kernel/sync/atomic/predefine.rs |  35 +++--
 rust/kernel/time.rs                  |  82 +++++-----
 14 files changed, 665 insertions(+), 324 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-backport-cfg_select-54f5e3d034ed

-- 
Nika Krasnova

