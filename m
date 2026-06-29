Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EC63E9580
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747289; cv=none; b=Bm3cJmvyVJmT8kMaGE1rlCGPjSGsq+QCNnZe00XUTeqSUe7DjFrzoPS0ua/xYVg9qolnEUW2HDVND5ipvqk5Qx6HDsjPFT97yo7kVa9LgKlnkmQKy2YaZUfyh2xjz42ndJkH3rJMTQeKrn4rnsNy7pGm3VRaXdCAXR2/2zAxTPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747289; c=relaxed/simple;
	bh=S7TtvWhOVIWhfqpCK7B2X7FblWRLReT9XRQLHAKUMyo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ZaqNa+V5DtqSVQfrPGYwmCRLWXLwHgeB2H2JZoTfGtKPn/PAtjWGMZuUeKQnqd+cr1NZQWElFyMyodxhE1HcbUeyDuFe6djuR3YxZX13NVHG/xAHEZUR54iZhgnB3DhZcE8i7wpvv4tsuwvv0gRuMVWDkfCF39VozOa952lPXkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=bRixWq0x; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=lvTVUOMX; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="bRixWq0x";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="lvTVUOMX"
DKIM-Signature: a=rsa-sha256; b=bRixWq0xdzgpzdZlLatle0utxt2jwGjTDhANCrztTzqPcrfC9cApUnAwWInde58tDYgNJk9i86LKfYSNM+7DMcfgzK0ExLlxibM7TTRsx5Tvv7VbU54NXS+xZEV541nwB1S2+15q5eJO93WFNGfDhkJZOLvfcjhfvXV9nnTaoXW8lUNBAt9f0N1o80vdFuNAS/8X6Dd98fyKJF2JyONmY7KKvilFJ6jVVmxvhaVLorJ3YP0J+tJb0LuU8dewSx14D+yD8PR+hF4zKW35LMLAErapA7Q6h338FcKPdGu29NMgkapf5kfkuPbHp2ETNf8OoNkpLYMYKl/wRFSrTbUNug==; s=purelymail2; d=nikableh.moe; v=1; bh=S7TtvWhOVIWhfqpCK7B2X7FblWRLReT9XRQLHAKUMyo=; h=Received:Date:From:To:Subject;
DKIM-Signature: a=rsa-sha256; b=lvTVUOMX1azv+iSUixL82x7EqkugX7ZvPmEwpZWq5AqWXWDcKfXzYKuvQInLqJY5dJuzXCC6to/cn/c4YErs8f1CaivsvhpRYlxxzZUN3MGQVEyzKD1yglZxHwpVUaaSKGcCGzwysyNxzdTlYVUv1skqTqAGBgAeP68b2YVfkIVlgKAHDeTJGuAf/mKbqon3V6aTWXoJ//e30LzaaQEeu18wPdOtTq2JohHAjL6Zs+igPRwiu12FhHC7+8iMQPeRioNmdPiRVWak2qDb/4IcseJLRqZoceNdYDklOZelQo5yevw0Ncb1dwDVnEBAiBEeLT3o78B6r62iGeFwqVATnA==; s=purelymail2; d=purelymail.com; v=1; bh=S7TtvWhOVIWhfqpCK7B2X7FblWRLReT9XRQLHAKUMyo=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: linux-kselftest@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPA id -1921897467;
          Mon, 29 Jun 2026 15:34:06 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 29 Jun 2026 17:34:05 +0200
From: Nika Krasnova <nika@nikableh.moe>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, Viresh Kumar
 <viresh.kumar@linaro.org>, Yury Norov <yury.norov@gmail.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, David
 Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/2] rust: kernel: add cfg_select! and use it for
 config-based selection
In-Reply-To: <CANiq72kG8k3mk+Xjr6q7aKg212QUNtZk5w4rxV=UGR5UXKE_ng@mail.gmail.com>
References: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe>
 <CANiq72kG8k3mk+Xjr6q7aKg212QUNtZk5w4rxV=UGR5UXKE_ng@mail.gmail.com>
User-Agent: Purely Mail via Roundcube/1.6.16
Message-ID: <0eb77f4b7199e9af01d61e0c1ac03c99@purelymail.com>
X-Sender: nika@nikableh.moe
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-06-29 11:38:22 +0200, Miguel Ojeda wrote:
> For instance, instead of waiting for the MSRV bump, could we already
> use the upstream one since Rust 1.91.0? That means that we are already
> sure we are using the upstream one as-is.
> 
> Or is there a reason to avoid that?

There is one, yes. First the toolchain picture (tested with
RUSTC_BOOTSTRAP=1):

  - 1.85.0 (current MSRV): core::cfg_select does not exist -- only the 
older
    core::cfg_match (old `cfg(...)` arm syntax).
  - 1.94.1: core::cfg_select present behind #![feature(cfg_select)], with
    the final builtin behavior (single-brace expression position works).
  - 1.95.0: core::cfg_select stable.

A gate (upstream when available, fallback when not) is possible, but 
unlike
the cold_path case the fallback isn't a drop-in replacement. In item and
statement position the two are identical (single braces), but in pure
expression-operand position they are mutually exclusive: the builtin 
takes
single braces, while the macro_rules needs an extra pair
(cfg_select! {{ ... }}), since it cannot put #[cfg] on a bare expression
without stmt_expr_attributes. No single spelling compiles on both.

That means a gate would force prohibiting expression-operand position
entirely (no portable spelling), which I would rather not do. I would
prefer to keep the macro_rules everywhere -- one consistent macro on 
every
toolchain, expression position included -- and switch wholesale to
core::cfg_select once the MSRV reaches a version that has it. The switch 
is
cheap: item/statement call sites are unchanged, and the only edit is
dropping the extra braces at any expression-position sites (there are 
none
in the tree today).

I will still move it into std_vendor.rs and align the docs with 
upstream's,
keeping the expression-position note since that is the one real 
difference.

Does that work for you, or would you rather take the gate and drop
expression-operand support?

-- 
Nika Krasnova
