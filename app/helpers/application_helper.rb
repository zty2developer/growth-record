module ApplicationHelper
	def markdown(text)
		options = {
			autolink: true,
			space_after_headers: true,
			fenced_code_blocks: true,
			no_intra_emphasis: true,
			hard_wrap: true,
			disable_indented_code_blocks: true,
			lax_spacing: true,
			strikethrough: true
		}
		language ||= :ruby
		markdown = Redcarpet::Markdown.new(HTMLWithCodeRay, options)
		markdown.render(text).html_safe
	end

	class HTMLWithCodeRay < Redcarpet::Render::HTML
		def block_code(code, language="ruby")
			CodeRay.scan(code, language="ruby").div(:tab_width => 2)
		end
	end
end
