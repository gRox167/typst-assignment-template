
#let problem_counter = counter("problem")

#let prob(body) = {
  // let current_problem = problem_counter.step()
  [== Problem #problem_counter.step() #problem_counter.display()]
  block(fill:rgb(250, 255, 250),
   width: 100%,
   inset:8pt,
   radius: 4pt,
   stroke:rgb(31, 199, 31),
   body)
  }

// Some math operators
#let prox = [#math.op("prox")]
#let proj = [#math.op("proj")]
#let argmin = [#math.arg]+[#math.min]


// Initiate the document title, author...
#let assignment_class(title, author, course_id, professor_name, semester, due_time, body) = {
  set document(title: title, author: author)
  set page(
    paper:"us-letter", 
    header: locate( 
        loc => if (
            counter(page).at(loc).first()==1) { none } 
        else if (counter(page).at(loc).first()==2) { align(right, 
              [*#author* | *#course_id: #title* | *Problem 1*]
            ) }
        else { 
            align(right, 
              [*#author* | *#course_id: #title* | *Problem #problem_counter.at(loc).first()*]
            ) 
        }
    ), 
    footer: locate(loc => {
      let page_number = counter(page).at(loc).first()
      let total_pages = counter(page).final(loc).last()
      align(center)[Page #page_number of #total_pages]
    }))
  block(height:25%,fill:none)
  align(center, text(17pt)[
    *#course_id: #title*])
  align(center, text(10pt)[
    Due on #due_time])
  align(center, [_Prof. #professor_name _, #semester, #due_time])
  block(height:35%,fill:none)
  align(center)[*#author*]
  
  pagebreak(weak: false)
  body
  
    // locate(loc => {
    //   let i = counter(page).at(loc).first()
    //   if i == 1 { return }
    //   set text(size: script-size)
    //   grid(
    //     columns: (6em, 1fr, 6em),
    //     if calc.even(i) [#i],
    //     align(center, upper(
    //       if calc.odd(i) { title } else { author-string }
    //     )),
    //     if calc.odd(i) { align(right)[#i] }
    //   )
    // })

//   if student_number != none {
//     align(top + left)[Student number: #student_number]
//   }

//   align(center)[= #title]
}
