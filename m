From: akpm@linux-foundation.org (Andrew Morton)
Date: Tue, 19 Mar 2019 11:32:12 -0700
Subject: [PATCH v12 00/13] arm64: untag user pointers passed to the kernel
In-Reply-To: <cover.1552929301.git.andreyknvl@google.com>
References: <cover.1552929301.git.andreyknvl@google.com>
Message-ID: <20190319113212.ca1d56301112454dfb5a39ba@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190319183212.RY-Thpevw6Zs0TR5XONFxymKe-3w0SROwPlT5L0tNZI@z>

On Mon, 18 Mar 2019 18:17:32 +0100 Andrey Konovalov <andreyknvl@google.com> wrote:

> === Notes
> 
> This patchset is meant to be merged together with "arm64 relaxed ABI" [3].

What does this mean, precisely?  That neither series is useful without
the other?  That either patchset will break things without the other?

Only a small fraction of these patches carry evidence of having been
reviewed.  Fixable?

Which maintainer tree would be appropriate for carrying these patches?
