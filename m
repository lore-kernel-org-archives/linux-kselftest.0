From: willy@infradead.org (Matthew Wilcox)
Date: Sat, 29 Sep 2018 12:44:29 -0700
Subject: [PATCH 0/3] namei: implement various scoping AT_* flags
In-Reply-To: <9D01A225-05BE-4B4A-873A-94168D17F687@amacapital.net>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <1EE20CA2-4C8B-4A80-B613-0277D92B376D@amacapital.net>
 <20180929154551.jsi6dt3xjxdxoqeh@ryuk>
 <9D01A225-05BE-4B4A-873A-94168D17F687@amacapital.net>
Message-ID: <20180929194429.GA1702@bombadil.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180929194429.Q0dJuMSIEtxGifRi9w0KMl7sCsPzNJekAMBlzI1JDl8@z>

On Sat, Sep 29, 2018@09:34:24AM -0700, Andy Lutomirski wrote:
> Also, as a perhaps-silly suggestion: if you end up adding a new
> syscall, I can see a use for a mode that does the path walk but, rather
> than failing on a disallowed link, stops early and indicates where it
> stopped. Then web servers, samba, etc can more efficiently implement
> custom behavior when links are encountered.  And it may also be useful
> to have a variant of AT_THIS_ROOT where trying to escape is an error
> instead of having it just get stuck at the root.

AT_USER_LINKS indicating that userspace wants to resolve symlinks
themselves?
