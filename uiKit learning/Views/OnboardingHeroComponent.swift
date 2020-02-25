//
//  OnboardingHeroComponent.swift
//  uiKit learning
//
//  Created by Trent Bowden on 2/2/20.
//  Copyright © 2020 Trent Bowden. All rights reserved.
//
//  The UiScrollView and page control, takes in a vector of
//  Title, description, image and displays them as onboarding.
//

import UIKit

class OnboardingHeroComponent: UIViewController, UIScrollViewDelegate {
    
    let heroView:UIView = {
        let view = UIView();
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let pageController:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    let scrollViewContainer: UIStackView = {
       let view = UIStackView()
        view.backgroundColor = .white
        view.axis = .horizontal
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func makeOnboardingSlide(pageContent: OnboardC_Data) -> UIView {
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 400).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        
        let titleLabel = UILabel()
        titleLabel.text = pageContent.title
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        let image = UIImage(named: pageContent.imageURL)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = pageContent.description
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 15.0)
        
        // The views are added from the bottom up, because the text knows it's own size.
        
        // Description is always at the bottom.
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Title label is between them
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Image is up top.
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo:view.topAnchor, constant: 40).isActive = true
        imageView.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -10).isActive = true
        imageView.bottomAnchor.constraint(equalTo:titleLabel.topAnchor).isActive = true
      
        return view
    }
    
    func OnboardingHeroView(pageContents: [OnboardC_Data]) -> UIView {
        scrollView.addSubview(scrollViewContainer)
        
        for pageContent in pageContents {
            scrollViewContainer.addArrangedSubview(makeOnboardingSlide(pageContent: pageContent))
        }
        
        // Add the scroll view and page controller.
        heroView.addSubview(scrollView)
        heroView.addSubview(pageController)
        
        // Pin the page controller to the bottom of the hero view
        pageController.bottomAnchor.constraint(equalTo: heroView.bottomAnchor, constant: -10).isActive = true
        pageController.centerXAnchor.constraint(equalTo: heroView.centerXAnchor).isActive = true
        
        // Pin the top, left and right anchors of the scroll view inside the hero.
        scrollView.topAnchor.constraint(equalTo: heroView.topAnchor, constant: 10).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: heroView.leadingAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: heroView.trailingAnchor, constant: -10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: pageController.topAnchor, constant: 0).isActive = true
        
        // Pin the scroll view container to the scrollview
        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // Important for scrolling:
        scrollViewContainer.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        // Configuration of the page control.
        // MYTODO sort out what colors we want here!
        pageController.numberOfPages = pageContents.count
        pageController.currentPage = 0
        pageController.pageIndicatorTintColor = .black
        pageController.currentPageIndicatorTintColor = .green
        
        // Make the scroll view snap to pages.
        let trailingOffset = CGPoint(x: scrollView.contentSize.width - scrollView.bounds.size.width, y: 0)
        scrollView.setContentOffset(trailingOffset, animated: true)
        
        // The parent will need to create the constraints for this hero view.
        return heroView
    }
}

